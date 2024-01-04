FROM python:3.9-slim

RUN apt update && \
    apt install --no-install-recommends -y build-essential gcc && \
    apt clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
COPY pyproject.toml pyproject.toml
COPY 02476_mnist/ 02476_mnist/
COPY data/ data/

WORKDIR /
RUN pip install . --no-cache-dir

ENTRYPOINT ["python", "-u", "02476_mnist/models/train_model.py"]