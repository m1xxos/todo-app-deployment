from fastapi import FastAPI, Request, Response
from prometheus_fastapi_instrumentator import Instrumentator

from . import models
from .database import SessionLocal, engine
from .routers import todos, users

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

instrumentator = Instrumentator().instrument(app)
Instrumentator().instrument(app).expose(app)


@app.middleware("http")
async def db_session_middleware(request: Request, call_next):
    response = Response("Internal server error", status_code=500)
    try:
        request.state.db = SessionLocal()
        response = await call_next(request)
    finally:
        request.state.db.close()
    return response


@app.get("/ping", status_code=200)
async def ping():
    return {"ping": "ok"}


app.include_router(users.router)
app.include_router(todos.router)
