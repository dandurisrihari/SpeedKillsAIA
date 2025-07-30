
#!/usr/bin/env python3

import os
from openai import OpenAI


# Set your OpenRouter API key in the environment or hardcode it (not recommended)
api_key = os.getenv("OPENROUTER_API_KEY")

if not api_key:
    raise ValueError("Set OPENROUTER_API_KEY as environment variable")

# Optional: Set site info for OpenRouter ranking
EXTRA_HEADERS = {
    "HTTP-Referer": "https://your-site.com",  # optional
    "X-Title": "My Chat App",                 # optional
}



# Create OpenAI client targeting OpenRouter
client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key=api_key,
)

# Conversation history
messages = [{"role": "system", "content": "You are a helpful assistant."}]

while True:
    user_input = input("You: ")
    if user_input.lower() in ("exit", "quit"):
        break

    messages.append({"role": "user", "content": user_input})

    try:
        completion = client.chat.completions.create(
            model="openai/gpt-4o",  # or any other model from OpenRouter
            messages=messages,
            extra_headers=EXTRA_HEADERS,
        )
        reply = completion.choices[0].message.content
        print("Assistant:", reply)
        messages.append({"role": "assistant", "content": reply})

    except Exception as e:
        print("Error:", e)
