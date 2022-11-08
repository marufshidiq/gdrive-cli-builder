# Using FastAPI to build a localhost server for getting back the data from the url

# API libs
# import rich.console
import uvicorn
from fastapi import FastAPI
import time, os, shutil
from pathlib import Path
from rich.console import Console
import urllib.parse as ups


# Zero Time
start_time = time.time()

# Initiate API
app = FastAPI()

@app.get("/")
def main_root(state: str, code: str, scope: str):
    string = f"{code}&scope={scope}"
    cleaned_code = ups.unquote(string)
    return {
            "status": "success",
            "Message": f"Your code is ready to be used: {cleaned_code}",
            }

def rich_print(message: str, console: Console = Console()) -> None:
    """Print the message with rich style. Give me anything with rich style."""
    console.print(f"{message}")
    return


rich_print(f"[gold1][Time][white] Loading 'localhost' Serve Running on: {time.time()}")
uvicorn.run(app, host='0.0.0.0', port=3030)
