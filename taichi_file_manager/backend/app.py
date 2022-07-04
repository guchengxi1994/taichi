from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from starlette.responses import FileResponse
import uvicorn
from model import FileTags, Files

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/allFiles")
async def getAllFiles():
    select_queries = (Files.select(Files.create_at, Files.depth,
                                   Files.father_path, Files.file_name,
                                   Files.saved_path,
                                   Files.file_id).where(Files.is_deleted == 0))
    for q in select_queries:
        print(q.file_id)
    return {"code": 20000, "message": "", "savedFiles": []}


if __name__ == "__main__":
    uvicorn.run(app="app:app",
                host="0.0.0.0",
                port=62387,
                reload=True,
                debug=True)
