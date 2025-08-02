#!/usr/bin/env python3
"""
LLM Analysis Module

Provides AI-powered analysis capabilities for kernel instrumentation and security research.
"""

import os
import argparse
import sys
from openai import OpenAI
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Read the API key
api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    print("Warning: OPENAI_API_KEY not found in .env")
    print("Please set up your OpenAI API key to use LLM analysis features.")

# Create the OpenAI client if API key is available
client = None
if api_key:
    client = OpenAI(api_key=api_key)

# Initialize message history
messages = [{"role": "system", "content": "You are a helpful assistant specialized in kernel instrumentation, security analysis, and Linux kernel development."}]

def chat_with_openai():
    while True:
        try:
            user_input = input("\nYou: ").strip()
            if not user_input:
                continue
            if user_input.lower() in {"exit", "quit"}:
                print("Exiting chat.")
                break

            # Add user message
            messages.append({"role": "user", "content": user_input})

            # Make API call
            response = client.chat.completions.create(
                model="gpt-4",  # or "gpt-3.5-turbo"
                messages=messages,
                temperature=0.7
            )

            reply = response.choices[0].message.content.strip()
            messages.append({"role": "assistant", "content": reply})
            print(f"\nAssistant: {reply}")

        except KeyboardInterrupt:
            print("\n[Interrupted by user, exiting]")
            break
        except Exception as e:
            print(f"\n[Error] {e}")
            break

if __name__ == "__main__":
    print("Chat started. Type 'exit' or 'quit' to end.")
    chat_with_openai()
