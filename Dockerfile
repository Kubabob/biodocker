FROM ubuntu:latest

WORKDIR /home/biodocker

RUN ["apt-get", "update"]
RUN ["apt-get", "upgrade"]
RUN ["apt-get", "install", "python3", "-y"]
RUN ["apt-get", "install", "python3-pip", "-y"]
RUN ["apt-get", "install", "python3-venv", "-y"]
RUN ["python3", "-m", "venv", ".venv"]
#RUN ["-source .venv/bin/activate"]
RUN [".venv/bin/pip", "install", "requests"]
RUN [".venv/bin/pip", "install", "fastapi[standard]", "uvicorn"]

ENV UNIPROT="P12345"

COPY prog.py .


EXPOSE 8001

CMD [".venv/bin/uvicorn", "prog:app", "--host", "0.0.0.0", "--port", "8001"]
