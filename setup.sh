#!/bin/bash

## This script is re-entrant and idempotent.
## It checks if the DuckDB model is downloaded and if not, downloads it.
## It also checks if the required dependencies are installed and if not, installs them.

## Are we running inside GitHub Codespaces?
if [ "$CODESPACE" = "true" ]; then
  echo "Running inside GitHub Codespaces. Will not need to download the model. The model is too large for Codespaces."
  printf "\e[31mYou cannot run DuckDBSI.ipnyb in GitHub Codespaces. Please run it locally.\e[0m\n"
else
  echo "Not running inside GitHub Codespaces"
  # Download the model if not already downloaded
  if [ ! -f "DuckDB-NSQL-7B-v0.1-q8_0.gguf" ]; then
      ## Check if the huggingface-cli is installed. If not, install it.
      ## we need huggingface-cli to download the model from huggingface hub
      if ! [ -x "$(command -v huggingface-cli)" ]; then
        echo 'Error: huggingface-cli is not installed.' >&2
        ##printf "\e[31mPlease install it using the following command:\e[0m\n"
        echo 'pip install huggingface_hub[cli]'
        exit 1
      else
        echo 'huggingface-cli is installed.'
      fi

      echo "Downloading the DuckDB model..."
      huggingface-cli download motherduckdb/DuckDB-NSQL-7B-v0.1-GGUF DuckDB-NSQL-7B-v0.1-q8_0.gguf --local-dir . --local-dir-use-symlinks False
  else
      echo "DuckDB model is already downloaded."
  fi

  # Check if we are inside a conda environment not called base
  if [ -z "$CONDA_DEFAULT_ENV" ] || echo "$CONDA_DEFAULT_ENV" | grep -q "base" ; then
    # no conda. see if we are inside docker container
    if [ -f /.dockerenv ]; then
      echo "Running inside a docker container..."
    else
      echo "Not running inside a docker container or conda"
      printf "\e[31mPlease activate the conda environment.\e[0m\n"
      exit 1
    fi
  else
    echo "Running inside conda environment: $CONDA_DEFAULT_ENV"
  fi  
fi

# Update pip if needed
pip install --upgrade pip

# check that pandasai is installed by running `pip list | grep pandasai``
# if not installed, run `pip install -r requirements.txt`
output=$(pip list)
if echo "$output" | grep -q "streamlit"; then
  echo "Dependencies are already installed."
else
  echo "Missing dependencies. Running: pip install -r requirements..."
  pip install -r requirements.txt
fi

echo "Setup is complete."