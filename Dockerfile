FROM archlinux

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "python3-pip"]
RUN ["curl", "-LsSf", "https://astral.sh/uv/install.sh", "|", "sh"]
RUN ["uv", "venv"]
RUN ["source", ".venv/bin/activate"]
RUN ["uv", "pip", "install", "requests"]
RUN ["uv", "pip", "install", "'fastapi[standard]'"]

ENV UNIPROT="P12345"

WORKDIR /home/biodocker

COPY prog.py .

ENTRYPOINT [ "fastapi", "dev", "prog.py" ]
