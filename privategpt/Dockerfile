# I don't know if i should pull nvidia/cuda or maybe another image like the pytorch one?
FROM nvidia/cuda:12.3.1-devel-ubuntu22.04

WORKDIR /workspace
# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential

RUN apt-get install -y git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev 

RUN apt-get install -y libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl libffi-dev

RUN git clone https://github.com/imartinez/privateGPT

RUN apt-get update && apt-get install -y curl

RUN curl -sSL https://pyenv.run | bash
RUN export PATH="/home/$(whoami)/.pyenv/bin:$PATH"

ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PATH"

RUN echo 'export PYENV_ROOT="/root/.pyenv"' >> /root/.bashrc
RUN echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> /root/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> /root/.bashrc

RUN apt-get install -y lzma
RUN apt-get install -y liblzma-dev

RUN apt-get install python3-pip -y

RUN pyenv install 3.11
RUN pyenv global 3.11
RUN pip install pip --upgrade
RUN pyenv local 3.11

RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to the PATH
ENV PATH="/root/.poetry/bin:$PATH"

ENV PATH="/root/.local/bin:$PATH"

RUN apt-get install -y pciutils

RUN curl -fsSL https://ollama.com/install.sh | sh
COPY ./start-ollama.sh .
RUN chmod +x start-ollama.sh
RUN ./start-ollama.sh

RUN cd privateGPT
RUN poetry install --extras "ui embeddings-huggingface llms-llama-cpp vector-stores-qdrant"

RUN CMAKE_ARGS='-DLLAMA_CUBLAS=on' poetry run pip install --force-reinstall --no-cache-dir llama-cpp-python

RUN poetry run python scripts/setup
#ENV PATH="/root/.poetry/bin:$PATH"
