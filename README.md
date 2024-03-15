## Project
This project serves as an example to setup an environment for LLM and Python. This project uses Conda to setup a separate python environment and VSCode with Jupyter plugins.

## Pre-requisites
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

## Environment

The following instructions are one time environment setup
- Create a conda environment
```bash
conda create --name pandasai python=3.11
```
- Activate the environment
```bash
conda activate pandasai
```
- Get dependencies to the environment. Run the following in the terminal after activating the conda environment
```bash
pip install -r requirements.txt
```

Now you're ready to work in VSCode using Jupyter Noteboook. You need to atach your conda environment as the notebook kernel.
As you save your project, VSCode will remember the kernel but if it does not, you can reattach it the same way:

- From VSCode when opening any .ipynb files, click on "Select Kernel" -> "Python Environments..." and select your conda environment: pandasai

### Setup
After creating the environment with Conda and activating it, you should run [setup.sh](./setup.sh) 

### Keys
Create a .env files and insert your keys there. This project uses OpenAI, Groq, and Anthropic keys. Don't worry, the .env file is includeded in the [.gitignore](.gitignore) file. The .env.sample provides a sample of the key names required. Your can get keys from:

- [OpenAI Dashboard](https://platform.openai.com/api-keys)
- [Groq Console](https://console.groq.com/keys)
- [Anthropic Console](https://console.anthropic.com/settings/keys)

### Dev Container
This project can be used as a Dev Container. More information can be found at https://containers.dev/

## Files
- setup.sh -> Run this bash file to setup your environment
- PandasAI.ipynb  -> Notebook sample about [PandasAI](https://docs.pandas-ai.com/)
- DuckDBAI.ipynb  -> Notebook sample for [DuckDB-NSQL](https://huggingface.co/motherduckdb/DuckDB-NSQL-7B-v0.1-GGUF). You will not be able to run this notebook in GitHub Codespaces because it needs the [DuckDB-NSQL-7B-v0.1-q8_0.gguf](https://huggingface.co/motherduckdb/DuckDB-NSQL-7B-v0.1-GGUF) model locally and Codespaces has space restrictions
