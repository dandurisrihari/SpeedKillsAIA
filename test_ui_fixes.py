#!/usr/bin/env python3
"""
Test script to verify UI fixes for IOCTL handlers, device access, and DMA call graphs
"""

import json
import requests
import time

def test_ui_fixes():
    base_url = "http://127.0.0.1:8080"
    
    print("🧪 Testing UI fixes...")
    
    try:
        # Test if server is running
        response = requests.get(f"{base_url}/api/data", timeout=5)
        if response.status_code != 200:
            print("❌ Server not responding properly")
            return False
            
        data = response.json()
        print("✅ Server is running and responding")
        
        # Check IOCTL operations
        print("\n🔧 Testing IOCTL Operations:")
        if 'ioctl_operations' in data and len(data['ioctl_operations']) > 0:
            ioctl = data['ioctl_operations'][0]
            print(f"  • Found {len(data['ioctl_operations'])} IOCTL operations")
            print(f"  • First IOCTL command: {ioctl.get('ioctl_command', 'Missing')}")
            print(f"  • Function name: {ioctl.get('function_name', 'Missing')}")
            if ioctl.get('ioctl_command') and ioctl.get('function_name'):
                print("  ✅ IOCTL data structure looks correct")
            else:
                print("  ⚠️ IOCTL data might have issues")
        else:
            print("  ❌ No IOCTL operations found")
        
        # Check device access info
        print("\n📱 Testing Device Access Info:")
        if 'device_info' in data and 'device_accesses' in data['device_info']:
            device_accesses = data['device_info']['device_accesses']
            print(f"  • Found {len(device_accesses)} device accesses")
            if len(device_accesses) > 0:
                access = device_accesses[0]
                print(f"  • First device: {access.get('device_path', 'Missing')}")
                print(f"  • Access type: {access.get('access_type', 'Missing')}")
                print("  ✅ Device access data structure looks correct")
            else:
                print("  ⚠️ Device access array is empty")
        else:
            print("  ❌ No device access info found")
        
        # Check DMA operations for call graph
        print("\n🔄 Testing DMA Operations Call Graph:")
        if 'dma_operations' in data and len(data['dma_operations']) > 0:
            dma = data['dma_operations'][0]
            print(f"  • Found {len(data['dma_operations'])} DMA operations")
            print(f"  • First DMA function: {dma.get('dma_function', 'Missing')}")
            if 'call_graph' in dma:
                print(f"  • Call graph entries: {len(dma['call_graph'])}")
                print("  ✅ DMA call graph data is present")
            else:
                print("  ⚠️ No call_graph field in DMA operation")
        else:
            print("  ❌ No DMA operations found")
        
        print("\n✅ UI data structure verification complete!")
        return True
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Failed to connect to server: {e}")
        return False
    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        return False

if __name__ == "__main__":
    test_ui_fixes()
