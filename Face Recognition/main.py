from fastapi import FastAPI, File, UploadFile
import subprocess
import os
import shutil

app = FastAPI()

@app.post("/adduser/")
async def add_user(file: UploadFile = File(...)):
    # Save uploaded file to dataset folder
    file_path = os.path.join("dataset", file.filename)
    with open(file_path, "wb") as buffer:
        shutil.copyfileobj(file.file, buffer)
    subprocess.call(["python", "AddUser.py", file_path])
    subprocess.call(["python", "FaceDataTraining.py"])
    subprocess.call(["python", "Recognition.py"])
    subprocess.call(["python", "cam.py"])
    
    return {"message": "User added and recognition started."}
