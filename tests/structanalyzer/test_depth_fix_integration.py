"""
Tests for struct analyzer depth fix

This test file can be run with pytest to verify the depth analysis fix.
"""

import subprocess
import sys
from pathlib import Path


def test_struct_analyzer_depth_progression():
    """Test that struct analyzer finds more structures with deeper analysis"""
    
    test_file = "data/structanalyzerpreprocessedfiles/gc_hal_kernel_driver.i"
    structure = "gcsHAL_INTERFACE"
    
    # Test with different depths
    depths = [1, 5, 100]
    structure_counts = []
    
    for depth in depths:
        cmd = [
            sys.executable, "-m", "src.structanalyzer",
            test_file, structure, "--depth", str(depth)
        ]
        
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
        assert result.returncode == 0, f"Command failed for depth {depth}: {result.stderr}"
        
        # Extract structure count
        count = None
        for line in result.stdout.split('\n'):
            if "Total structures analyzed:" in line:
                count = int(line.split(':')[1].strip())
                break
        
        assert count is not None, f"Could not find structure count in output for depth {depth}"
        structure_counts.append(count)
    
    # Validate results
    shallow_count, medium_count, deep_count = structure_counts
    
    # Should find substantial number of structures
    assert deep_count >= 50, f"Deep analysis should find at least 50 structures, got {deep_count}"
    
    # Structure count should not decrease with depth
    assert medium_count >= shallow_count, f"Medium depth ({medium_count}) should find >= shallow depth ({shallow_count})"
    
    # The fix: depth 100 should find much more than the original bug (which found ~3)
    assert deep_count > 10, f"Depth 100 should find much more than original bug, got {deep_count}"


def test_struct_analyzer_cache_clearing():
    """Test that cache clearing works when depth increases"""
    
    test_file = "data/structanalyzerpreprocessedfiles/gc_hal_kernel_driver.i"
    structure = "gcsHAL_INTERFACE"
    
    # First run with shallow depth
    cmd1 = [sys.executable, "-m", "src.structanalyzer", test_file, structure, "--depth", "1"]
    result1 = subprocess.run(cmd1, capture_output=True, text=True, timeout=30)
    assert result1.returncode == 0, f"First command failed: {result1.stderr}"
    
    # Second run with deep depth should find more (not use cached shallow results)
    cmd2 = [sys.executable, "-m", "src.structanalyzer", test_file, structure, "--depth", "10"]
    result2 = subprocess.run(cmd2, capture_output=True, text=True, timeout=30)
    assert result2.returncode == 0, f"Second command failed: {result2.stderr}"
    
    # Extract counts
    def get_count(output):
        for line in output.split('\n'):
            if "Total structures analyzed:" in line:
                return int(line.split(':')[1].strip())
        return None
    
    count1 = get_count(result1.stdout)
    count2 = get_count(result2.stdout)
    
    assert count1 is not None, "Could not find structure count in first output"
    assert count2 is not None, "Could not find structure count in second output"
    
    # Deep analysis should find same or more structures
    assert count2 >= count1, f"Deep analysis ({count2}) should find >= shallow analysis ({count1})"


def test_original_bug_reproduction():
    """Test that reproduces and verifies fix for the original bug"""
    
    # The original issue: --depth 100 only analyzed to depth 1 and found very few structures
    test_file = "data/structanalyzerpreprocessedfiles/gc_hal_kernel_driver.i"  
    structure = "gcsHAL_INTERFACE"
    
    cmd = [sys.executable, "-m", "src.structanalyzer", test_file, structure, "--depth", "100"]
    result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
    
    assert result.returncode == 0, f"Command failed: {result.stderr}"
    
    # Extract structure count
    structure_count = None
    for line in result.stdout.split('\n'):
        if "Total structures analyzed:" in line:
            structure_count = int(line.split(':')[1].strip())
            break
    
    assert structure_count is not None, "Could not find structure count in output"
    
    # BEFORE the fix: this would find only 3 structures
    # AFTER the fix: should find 50+ structures  
    assert structure_count >= 50, f"With depth 100, should find at least 50 structures, got {structure_count}"
    
    # Also check that analysis shows it's working on multiple structures
    assert "✅ Found" in result.stdout or "Found struct:" in result.stdout, "Should show evidence of analyzing multiple structures"


if __name__ == "__main__":
    # Run tests manually if not using pytest
    print("Running struct analyzer depth fix tests...")
    
    try:
        test_struct_analyzer_depth_progression()
        print("✅ Depth progression test passed")
        
        test_struct_analyzer_cache_clearing()
        print("✅ Cache clearing test passed")
        
        test_original_bug_reproduction()
        print("✅ Original bug reproduction test passed")
        
        print("\n🎉 All tests passed! The depth analysis fix is working correctly.")
        
    except AssertionError as e:
        print(f"❌ Test failed: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"❌ Test error: {e}")
        sys.exit(1)
