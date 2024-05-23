# Project
This project serves as an example to setup an environment for LLM and Python. This project uses Conda to setup a separate python environment and VSCode with Jupyter plugins.

# Create a virtual environment
You should create a virtual environment to work with this repository. This is a best practice to isolate your system configuration
from requirements from this repository.
There are a few ways to isolate your system from this repo:
- [venv](https://docs.python.org/3/library/venv.html). This README will not go over this method
- [Conda](https://docs.conda.io/). Quick instruction can be found below
- [Development Containers](https://containers.dev/). This README will not go over this method

## Clone the project
Start by cloning the project and cd to the cloned project folder:
```bash
git clone https://github.com/mlim1972/llm-test.git
cd llm-test
```

## Setting up Conda
If you do not have conda installed, you need to do so with the instructions below. You can check conda with the following command:
```bash
conda --version
```
If the above shows the version of conda installed, you can skip the Installing Conda section and go start from the Environment section. 

### Installing Conda
1. Install mini-forge or mini-conda (uninstall Anaconda)

Download and install miniforge from: https://conda-forge.org/miniforge/

For MacOS, you can use [Homebrew](https://brew.sh/)
```bash
brew install --cask miniforge
conda init zsh
```
More information: https://kirenz.github.io/codelabs/codelabs/miniforge-setup/

2. VSCode plugins
    - Jupyter by Microsoft
    - Python by Microsoft
    - Dev Containers by Microsoft

### Environment
The following instructions are one time environment setup
- Create a conda environment
```bash
conda create --name llmtest python=3.11
```
- Activate the environment
```bash
conda activate llmtest
```
After activation of your conda environment, confirm python 3.11.x is installed
```bash
python --version
```

- Get dependencies to the environment. Run the following in the terminal after activating the conda environment
```bash
pip install -r requirements.txt
```
or run the setup script 
```bash
./setup.sh
```

To deactivate your conda environment, you need call the following command:
```bash
conda deactivate
```

Now you're ready to work in VSCode using Jupyter Notebook. You need to attach your conda environment as the notebook kernel.
As you save your project, VSCode will remember the kernel but if it does not, you can reattach it the same way:

- From VSCode when opening any .ipynb files, click on "Select Kernel" -> "Python Environments..." and select your conda environment: llmtest

### Setup
After creating the environment with Conda and activating it, you should run [setup.sh](./setup.sh) 
```bash
./setup.sh
```

# Keys
Create a .env files and insert your keys there. Use the [.env.sample](.env.sample) file as reference. This project uses OpenAI, Groq, and Anthropic keys. Don't worry, the .env file is included in the [.gitignore](.gitignore) file. The .env.sample provides a sample of the key names required. Your can get keys from:

- [OpenAI Dashboard](https://platform.openai.com/api-keys)
- [Groq Console](https://console.groq.com/keys)
- [Anthropic Console](https://console.anthropic.com/settings/keys)
- [Cohere](https://cohere.com/)
- [NVidia](https://build.nvidia.com/explore/discover)
- [PandasAI](https://www.pandabi.ai/)


# Files
- setup.sh -> Run this bash file to setup your environment. The script detects if the project runs inside Conda, DevContainers, or GitHub Spaces to setup the necessary dependencies. If the repo is opened from DevContainers or GitHub Spaces, this script is run by default
- PandasAI.ipynb  -> Notebook sample about [PandasAI](https://docs.pandas-ai.com/)
- DuckDBAI.ipynb  -> Notebook sample for [DuckDB-NSQL](https://huggingface.co/motherduckdb/DuckDB-NSQL-7B-v0.1-GGUF)
- DuckDBAI2.ipynb  -> Notebook sample for [DuckDB-NSQL](https://huggingface.co/motherduckdb/DuckDB-NSQL-7B-v0.1-GGUF) served by Ollama
- Langchain-Wikipedia.ipynb -> Notebook sample showing how to use the Wikipedia Retriever in Langchain
- Lanchain-Chromadb.ipynb -> Notebook sample using Langchain with ChromaDB for RAG
- OllamaNotebook.ipynb -> Notebook sample showing how to use the 
[Ollama API](https://pypi.org/project/ollama/) to call the Chat and Generate endpoints
- chat.py. This is a [Streamlit](https://streamlit.io/) application that uses Ollama in a chat application. The following command is used to run it:
```bash
streamlit run chat.py
```

## Notebook Information
This project is divided into different notebooks for each access and learning topics. Below is further description of each notebook:

### DuckDB Notebooks
[DuckDB](https://duckdb.org/) is a embedded relational database build from the ground up to assist in data analytic. It is one of the fastest DB project for it's speed and flexibility. Think of DuckDB as a more robust [SQLite](https://www.sqlite.org/).

- DuckDBAI.ipynb. This notebook uses [llama.cpp](https://github.com/ggerganov/llama.cpp) for local inference against a local gguf model. You need to download the DuckDB-NSQL-7B-v0.1-q8_0.gguf model so this notebook can load it. The [setup.sh](./setup.sh) ensure you have all the necessary files and virtual environment ready to run all notebooks. This notebook queries a csv file using text to SQL prompting.
- DuckDBAI2.ipynb. This notebook uses Ollama with the duckdb-nsql:7b-q8_0 model. This is similar DuckDBAI.ipynb but instead of a local inference, it uses Ollama.

### Pandas Notebook
The Pandas notebook uses a library called [PandasAI](https://docs.pandas-ai.com/en/latest/LLMs/llms/) to query a csv file using text to SQL and the Pandas library.
Both DuckDB and Pandas notebook objective is show how we can use LLMs to query a DB (CSV file) using text to SQL prompting.

### Langchain Notebooks
The Langchain notebooks are example using langchain for document retrieval and RAG.

- Langchain-Wikipedia.ipynb. This notebook shows an example of retrieving Wikipedia results and answering questions from the results.
- Langchain-ChromaDB.ipynb. This notebook is an example of RAG. It uses an embedding model to create embeddings from documents. ChromaDB is used as the Vector Store and finally, it uses Ollama (and other providers) to respond to users inquiries. In addition, this notebook uses Ollama directly attaching the
prompt and embeddings w/o Langchain chains.

### Ollama Notebook
The Ollama notebook is an example to call Ollama using the two endpoints: chat and generate.

- OllamaNotbook.ipynb. The notebook uses Ollama API to call the localhost 
ollama server to interact with the Chat and Generate endpoint. In addition,
it also shows how to retrieve the response with and without streaming.


# Ollama
Some tests are using Ollama to run local models. Instructions to install Ollama can be found at [https://ollama.com/](https://ollama.com/) with the following models:
- llama3:8b-instruct-q8_0
- duckdb-nsql:7b-q8_0
- nomic-embed-text:latest

# Limitations
- GitHub Codespaces can be used with [PandasAI.ipynb](./PandasAI.ipynb) but will not work with [DuckDBAI.ipynb](./DuckDBAI.ipynb) or [DuckDBAI2.ipynb](./DuckDBAI2.ipynb) because of size limitations