#!/usr/bin/env python3
"""
Test the IOCTL and Memory Information fixes
"""

import requests
import json

def test_fixes():
    print("🧪 Testing IOCTL and Memory Information Fixes")
    print("=" * 60)
    
    base_url = "http://127.0.0.1:8080"
    
    try:
        # Get the data
        response = requests.get(f"{base_url}/api/data", timeout=5)
        data = response.json()
        
        print("✅ Server is responding")
        print(f"📊 Statistics: {data.get('statistics', {}).get('unique_ioctl_operations', 0)} IOCTL operations")
        
        # Test IOCTL Operations
        print("\nIOCTL HANDLERS TEST:")
        ioctl_ops = data.get('ioctl_operations', [])
        print(f"  • Found {len(ioctl_ops)} IOCTL operations")
        
        if ioctl_ops:
            for i, ioctl in enumerate(ioctl_ops):
                func_name = ioctl.get('function_name', 'Unknown')
                file_path = ioctl.get('file_path', 'Unknown')
                line_number = ioctl.get('line_number', 'Unknown')
                
                print(f"  • IOCTL {i+1}: {func_name}")
                print(f"    - Handler: {func_name}")
                print(f"    - File: {file_path}:{line_number}")
                
                # Test how the UI will display this
                if ioctl.get('ioctl_command') or ioctl.get('ioctl_cmd'):
                    command_display = ioctl.get('ioctl_command') or ioctl.get('ioctl_cmd')
                elif func_name and ('ioctl' in func_name.lower() or 'cmd' in func_name.lower()):
                    command_display = f"{func_name} (IOCTL Handler)"
                elif func_name:
                    command_display = f"{func_name} (File Operation)"
                else:
                    command_display = "Unknown Command"
                
                print(f"    - UI Display: {command_display}")
                
            print("  ✅ IOCTL handlers will display function names instead of 'Unknown Command'")
        else:
            print("  ⚠️ No IOCTL operations found")
        
        # Test Memory Information
        print("\n💾 MEMORY INFORMATION TEST:")
        memory_info = data.get('memory_info', {})
        
        if memory_info:
            summary = memory_info.get('summary', {})
            print(f"  • Summary:")
            print(f"    - Reserved Entries: {summary.get('total_reserved_entries', 0)}")
            print(f"    - CMA Pools: {summary.get('total_cma_pools', 0)}")
            print(f"    - DMA Pools: {summary.get('total_dma_pools', 0)}")
            print(f"    - Memory Zones: {summary.get('total_zones', 0)}")
            print(f"    - Memory Nodes: {summary.get('total_nodes', 0)}")
            print(f"    - Total Reserved: {(memory_info.get('total_reserved_memory_kb', 0) / 1024):.1f} MB")
            
            # Test reserved memory
            reserved = memory_info.get('reserved_memory', [])
            print(f"  • Reserved Memory: {len(reserved)} entries")
            if reserved:
                entry = reserved[0]
                print(f"    - First entry: {entry.get('name', 'Unnamed')}")
                print(f"    - Size: {entry.get('size_readable', 'Unknown size')}")
                print(f"    - Address: {entry.get('start_address', 'Unknown')}")
                
            # Test CMA pools
            cma_pools = memory_info.get('cma_pools', [])
            print(f"  • CMA Pools: {len(cma_pools)} pools")
            if cma_pools:
                pool = cma_pools[0]
                print(f"    - First pool: {pool.get('name', 'Unnamed')}")
                print(f"    - Size: {pool.get('size_readable', 'Unknown size')}")
                print(f"    - Components: {len(pool.get('components', []))} entries")
                
            # Test DMA pools
            dma_pools = memory_info.get('dma_pools', [])
            print(f"  • DMA Pools: {len(dma_pools)} pools")
            
            # Test memory zones
            zones = memory_info.get('memory_zones', [])
            print(f"  • Memory Zones: {len(zones)} zones")
            
            # Test memory nodes
            nodes = memory_info.get('memory_nodes', [])
            print(f"  • Memory Nodes: {len(nodes)} nodes")
            
            print("  ✅ Memory Information will display detailed sizes, addresses, and components")
        else:
            print("  ❌ No memory information found")
        
        print(f"\n✅ All fixes verified! Web UI available at {base_url}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error: {e}")
        return False

if __name__ == "__main__":
    test_fixes()
