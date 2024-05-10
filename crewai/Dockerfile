FROM pytorch/pytorch:2.3.0-cuda12.1-cudnn8-devel

WORKDIR /workspace

COPY requirements.txt ./requirements.txt

COPY Test_GPU_available.ipynb ./Test_GPU_available.ipynb

RUN mkdir -p /workspace/crewai-parser-28

RUN python3 -m pip install tensorflow[and-cuda]

RUN apt-get update && apt-get install -y curl

RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to the PATH
ENV PATH="/root/.poetry/bin:$PATH"

ENV PATH="/root/.local/bin:$PATH"

RUN apt-get install -y pciutils

RUN curl -fsSL https://ollama.com/install.sh | sh

RUN pip install -r requirements.txt

# Set the working directory to the project folder
WORKDIR /workspace/crewai-parser-28/

COPY ./workspace/crewai-parser-28/pyproject.toml .
COPY ./workspace/crewai-parser-28/poetry.lock .
COPY ./workspace/crewai-parser-28/create-mistral-model-file.sh .

# Install project dependencies
RUN poetry install --no-root

#RUN ollama serve &

#RUN ./create-mistral-model-file.sh

EXPOSE 8888

### que tal si... copio les coses, instalo pero despres utilitzo igualment el volume per fer les coses?
### hmmm es pot copiar les coses a una carpeta i despres fer un volume per aquesta carpeta??
