import requests
import os

from fastapi import FastAPI

app = FastAPI()

@app.get("/{uniprot_id}")
def get_uniprot(uniprot_id: str):
    resp = requests.get(f'https://rest.uniprot.org/uniprotkb/{uniprot_id}.fasta')

    with open(f'./{uniprot_id}.fasta', 'w') as f:
        f.write(resp.text)

@app.get("/")
def read_root():
    return {"Hello": "World"}