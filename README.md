# Project
This project serves as an example to setup an environment for LLM and Python. This project uses Conda to setup a separate python environment and VSCode with Jupyter plugins.

# Create a virtual environment
You should create a virtual environment to work with this repository. This is a best practice to isolate your system configuration
from requirements from this repository.
There are a few ways to isolate your system from this repo:
- [venv](https://docs.python.org/3/library/venv.html). This README will not go over this method
- [Conda](https://docs.conda.io/). Quick instruction can be found below
- [Development Containers](https://containers.dev/). This README will not go over this method

## Setting up Conda
### Installing Conda
1. Install mini-forge or mini-conda (uninstall Anaconda)

Download and install miniforge from: https://conda-forge.org/miniforge/

For MacOS, you can use [Homebrew](https://brew.sh/)
```bash
brew install --cask miniforge
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
- Get dependencies to the environment. Run the following in the terminal after activating the conda environment
```bash
pip install -r requirements.txt
```

Now you're ready to work in VSCode using Jupyter Notebook. You need to attach your conda environment as the notebook kernel.
As you save your project, VSCode will remember the kernel but if it does not, you can reattach it the same way:

- From VSCode when opening any .ipynb files, click on "Select Kernel" -> "Python Environments..." and select your conda environment: llmtest

### Setup
After creating the environment with Conda and activating it, you should run [setup.sh](./setup.sh) 

# Keys
Create a .env files and insert your keys there. Use the [.env.sample](.env.sample) file as reference. This project uses OpenAI, Groq, and Anthropic keys. Don't worry, the .env file is included in the [.gitignore](.gitignore) file. The .env.sample provides a sample of the key names required. Your can get keys from:

- [OpenAI Dashboard](https://platform.openai.com/api-keys)
- [Groq Console](https://console.groq.com/keys)
- [Anthropic Console](https://console.anthropic.com/settings/keys)


# Files
- setup.sh -> Run this bash file to setup your environment. The script detects if the project runs inside Conda, DevContainers, or GitHub Spaces to setup the necessary dependencies. If the repo is opened from DevContainers or GitHub Spaces, this script is run by default
- PandasAI.ipynb  -> Notebook sample about [PandasAI](https://docs.pandas-ai.com/)
- DuckDBAI.ipynb  -> Notebook sample for [DuckDB-NSQL](https://huggingface.co/motherduckdb/DuckDB-NSQL-7B-v0.1-GGUF)
- DuckDBAI2.ipynb  -> Notebook sample for [DuckDB-NSQL](https://huggingface.co/motherduckdb/DuckDB-NSQL-7B-v0.1-GGUF) served by Ollama

# Limitations
- GitHub Codespaces can be with [PandasAI.ipynb]() but will not work with [DuckDBAI.ipynb]() or [DuckDBAI2.ipynb]() because of size limitations