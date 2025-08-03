#!/usr/bin/env python3
"""
Batch processing interface for the kernel log parser

This module handles batch processing of multiple log files,
with progress tracking, error handling, and result aggregation.
"""

from typing import List, Dict, Optional, Union, Callable
from pathlib import Path
import json
import concurrent.futures
from dataclasses import dataclass
import time

from ..core.engine import KernelLogParserEngine
from ..config.settings import ParserSettings


@dataclass
class BatchResult:
    """Result from processing a single file in a batch"""
    file_path: str
    success: bool
    results: Optional[Dict] = None
    error: Optional[str] = None
    processing_time: float = 0.0
    output_file: Optional[str] = None


@dataclass 
class BatchSummary:
    """Summary of batch processing results"""
    total_files: int
    successful: int
    failed: int
    total_time: float
    results: List[BatchResult]
    
    @property
    def success_rate(self) -> float:
        """Calculate success rate as percentage"""
        if self.total_files == 0:
            return 0.0
        return (self.successful / self.total_files) * 100


class BatchProcessor:
    """
    Batch processor for multiple log files
    
    Handles concurrent processing of multiple log files with
    comprehensive error handling and progress reporting.
    """
    
    def __init__(self, config: Optional[ParserSettings] = None, 
                 max_workers: Optional[int] = None):
        """
        Initialize batch processor
        
        Args:
            config: Parser configuration settings
            max_workers: Maximum number of concurrent workers. If None, uses CPU count.
        """
        self.config = config or ParserSettings()
        self.max_workers = max_workers
        self.progress_callback: Optional[Callable] = None
    
    def set_progress_callback(self, callback: Callable[[int, int, str], None]) -> None:
        """
        Set callback function for progress updates
        
        Args:
            callback: Function that takes (completed, total, current_file) parameters
        """
        self.progress_callback = callback
    
    def process_files(self, file_paths: List[Union[str, Path]], 
                     output_dir: Optional[Union[str, Path]] = None,
                     concurrent: bool = True) -> BatchSummary:
        """
        Process multiple log files
        
        Args:
            file_paths: List of log file paths to process
            output_dir: Optional directory to save individual results
            concurrent: Whether to process files concurrently
            
        Returns:
            BatchSummary with processing results
        """
        start_time = time.time()
        
        # Validate inputs
        valid_files = []
        for file_path in file_paths:
            path = Path(file_path)
            if path.exists():
                valid_files.append(str(path))
            else:
                print(f"⚠️  Warning: File not found: {file_path}")
        
        if not valid_files:
            return BatchSummary(0, 0, 0, 0.0, [])
        
        # Create output directory if specified
        if output_dir:
            output_path = Path(output_dir)
            output_path.mkdir(parents=True, exist_ok=True)
        
        results = []
        
        if concurrent and len(valid_files) > 1:
            results = self._process_concurrent(valid_files, output_dir)
        else:
            results = self._process_sequential(valid_files, output_dir)
        
        total_time = time.time() - start_time
        successful = sum(1 for r in results if r.success)
        failed = len(results) - successful
        
        return BatchSummary(
            total_files=len(results),
            successful=successful,
            failed=failed,
            total_time=total_time,
            results=results
        )
    
    def _process_sequential(self, file_paths: List[str], 
                          output_dir: Optional[str]) -> List[BatchResult]:
        """Process files sequentially"""
        results = []
        
        for i, file_path in enumerate(file_paths, 1):
            if self.progress_callback:
                self.progress_callback(i - 1, len(file_paths), file_path)
            
            result = self._process_single_file(file_path, output_dir)
            results.append(result)
            
            # Print progress
            status = "✅" if result.success else "❌"
            print(f"{status} [{i}/{len(file_paths)}] {file_path} ({result.processing_time:.2f}s)")
        
        if self.progress_callback:
            self.progress_callback(len(file_paths), len(file_paths), "Complete")
        
        return results
    
    def _process_concurrent(self, file_paths: List[str], 
                          output_dir: Optional[str]) -> List[BatchResult]:
        """Process files concurrently"""
        results = []
        completed = 0
        
        with concurrent.futures.ThreadPoolExecutor(max_workers=self.max_workers) as executor:
            # Submit all tasks
            future_to_file = {
                executor.submit(self._process_single_file, file_path, output_dir): file_path
                for file_path in file_paths
            }
            
            # Process completed tasks
            for future in concurrent.futures.as_completed(future_to_file):
                file_path = future_to_file[future]
                try:
                    result = future.result()
                    results.append(result)
                    
                    completed += 1
                    
                    # Progress callback and status update
                    if self.progress_callback:
                        self.progress_callback(completed, len(file_paths), file_path)
                    
                    status = "✅" if result.success else "❌"
                    print(f"{status} [{completed}/{len(file_paths)}] {file_path} ({result.processing_time:.2f}s)")
                    
                except Exception as e:
                    # Handle unexpected errors
                    result = BatchResult(
                        file_path=file_path,
                        success=False,
                        error=f"Unexpected error: {e}",
                        processing_time=0.0
                    )
                    results.append(result)
                    completed += 1
                    
                    print(f"❌ [{completed}/{len(file_paths)}] {file_path} - Unexpected error: {e}")
        
        return results
    
    def _process_single_file(self, file_path: str, 
                           output_dir: Optional[str]) -> BatchResult:
        """Process a single file and return result"""
        start_time = time.time()
        
        try:
            # Determine output file if output directory is specified
            output_file = None
            if output_dir:
                file_name = Path(file_path).stem
                output_file = str(Path(output_dir) / f"{file_name}_parsed.json")
            
            # Create parser engine
            engine = KernelLogParserEngine(
                show_ui=False,  # Disable UI for batch processing
                source_root_path=self.config.source_root_path
            )
            
            # Parse the file
            results = engine.parse_log_file(file_path, output_file)
            
            # Convert to dict if needed
            if hasattr(results, 'to_dict'):
                results_dict = results.to_dict()
            else:
                results_dict = results
            
            processing_time = time.time() - start_time
            
            return BatchResult(
                file_path=file_path,
                success=True,
                results=results_dict,
                processing_time=processing_time,
                output_file=output_file
            )
            
        except Exception as e:
            processing_time = time.time() - start_time
            
            return BatchResult(
                file_path=file_path,
                success=False,
                error=str(e),
                processing_time=processing_time
            )
    
    def save_summary(self, summary: BatchSummary, 
                    output_file: Union[str, Path]) -> None:
        """
        Save batch processing summary to JSON file
        
        Args:
            summary: Batch summary to save
            output_file: Path to save the summary
        """
        summary_data = {
            'total_files': summary.total_files,
            'successful': summary.successful,
            'failed': summary.failed,
            'success_rate': summary.success_rate,
            'total_time': summary.total_time,
            'results': [
                {
                    'file_path': r.file_path,
                    'success': r.success,
                    'error': r.error,
                    'processing_time': r.processing_time,
                    'output_file': r.output_file
                }
                for r in summary.results
            ]
        }
        
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(summary_data, f, indent=2, sort_keys=True)
    
    def print_summary(self, summary: BatchSummary) -> None:
        """Print a formatted summary of batch processing results"""
        print("\n" + "="*60)
        print("BATCH PROCESSING SUMMARY")
        print("="*60)
        print(f"Total Files: {summary.total_files}")
        print(f"Successful: {summary.successful}")
        print(f"Failed: {summary.failed}")
        print(f"Success Rate: {summary.success_rate:.1f}%")
        print(f"Total Time: {summary.total_time:.2f} seconds")
        
        if summary.failed > 0:
            print(f"\n❌ Failed Files:")
            for result in summary.results:
                if not result.success:
                    print(f"  • {result.file_path}: {result.error}")
        
        print(f"\n⚡ Average Processing Time: {summary.total_time / summary.total_files:.2f}s per file")


# Convenience function for simple batch processing
def process_log_files(file_paths: List[Union[str, Path]], 
                     output_dir: Optional[Union[str, Path]] = None,
                     concurrent: bool = True,
                     source_root: Optional[str] = None) -> BatchSummary:
    """
    Convenience function to process multiple log files
    
    Args:
        file_paths: List of log file paths
        output_dir: Optional output directory for results
        concurrent: Whether to process concurrently
        source_root: Optional source root path
        
    Returns:
        BatchSummary with processing results
    """
    config = ParserSettings(source_root_path=source_root)
    processor = BatchProcessor(config)
    return processor.process_files(file_paths, output_dir, concurrent)
