from typing import List

import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from starlette.responses import FileResponse

from model import Files, FileTags

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class FileResponse(BaseModel):
    name: str
    savePath: str
    depth: int
    fatherPath: str
    timestamp: str
    tags: List[str]

    class Config:
        arbitrary_types_allowed = True


@app.get("/allFiles")
async def getAllFiles():
    select_queries = (Files.select(Files.create_at, Files.depth,
                                   Files.father_path, Files.file_name,
                                   Files.saved_path,
                                   Files.file_id).where(Files.is_deleted == 0))
    result = []
    for q in select_queries:
        print(q.file_id)
        select_tags = FileTags.select(
            FileTags.tag_name).where(FileTags.file_id == q.file_id)
        tags:List[str] = []
        for i in select_tags:
            tags.append(i.tag_name)
        print(tags)
        f = FileResponse(name=q.file_name,
                         savePath=q.saved_path,
                         depth=q.depth,
                         fatherPath=q.father_path,
                         timestamp=str(q.create_at),
                         tags=tags)
        result.append(f)
    return {"code": 20000, "message": "", "savedFiles": result}


if __name__ == "__main__":
    uvicorn.run(app="app:app",
                host="0.0.0.0",
                port=62387,
                reload=True,
                debug=True)
