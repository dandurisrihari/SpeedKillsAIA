#!/usr/bin/env python3
"""
Test Flask availability and webviewer startup
"""

import sys
import os

print("Python executable:", sys.executable)
print("Current directory:", os.getcwd())

# Test Flask import
try:
    import flask
    print("✅ Flask available:", flask.__version__)
    FLASK_AVAILABLE = True
except ImportError as e:
    print("❌ Flask import error:", e)
    FLASK_AVAILABLE = False

if FLASK_AVAILABLE:
    try:
        from src.webviewer.ui import create_app, FLASK_AVAILABLE as UI_FLASK_AVAILABLE
        print("✅ UI module imported successfully")
        print("UI module FLASK_AVAILABLE:", UI_FLASK_AVAILABLE)
        
        if UI_FLASK_AVAILABLE:
            app = create_app()
            print("✅ App created successfully")
            print("App routes:", len(app.url_map._rules), "rules registered")
        else:
            print("❌ UI module reports Flask not available")
            
    except Exception as e:
        print("❌ Error creating app:", e)
        import traceback
        traceback.print_exc()
else:
    print("❌ Cannot test UI module without Flask")
