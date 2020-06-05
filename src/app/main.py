from fastapi import FastAPI

app = FastAPI()

@app.get("/ping")
async def pong():
    # some async operation could happen here
    # example: `notes = await get_all_notes()`
    # see https://fastapi.tiangolo.com/async/ for detail introduce
    return {"ping": "pong!"}
