#!/bin/bash
set -e

# === Apache Airflow Installation Commands ===
# Before running, visit https://pypi.org/project/apache-airflow/
# to find the latest AIRFLOW_VERSION and its corresponding supported PYTHON_VERSION.
# Update the PYTHON_VERSION and AIRFLOW_VERSION variables below accordingly — no other changes to the script are needed.

# Update versions here as per the instructions above
AIRFLOW_VERSION=3.0.6
PYTHON_VERSION=3.12

# Update the packages using sudo apt update
sudo apt update

# Install the required Python version along with necessary packages
sudo apt install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-venv python${PYTHON_VERSION}-dev python3-pip build-essential

# Create a virtual environment for Airflow and activate it
mkdir -p ~/venvs
python${PYTHON_VERSION} -m venv ~/venvs/airflow_${AIRFLOW_VERSION}
source ~/venvs/airflow_${AIRFLOW_VERSION}/bin/activate

# Upgrade pip to the latest version
pip install --upgrade pip

# Define the constraint-file URL
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

# Install Apache Airflow with the specified version and constraints (dependency versions)
pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "$CONSTRAINT_URL"
