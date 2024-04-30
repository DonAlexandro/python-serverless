from fastapi import FastAPI
from src.env import config

MODE=config('MODE', default="test")

app = FastAPI()

@app.get('/')
def home_page():
    return {"Hello": "World", "MODE": MODE}
