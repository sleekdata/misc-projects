#!/bin/bash
set -e

# Before running, update the AIRFLOW_VERSION below as needed
AIRFLOW_VERSION=3.0.6

# Activate the virtual environment
source ~/venvs/airflow_${AIRFLOW_VERSION}/bin/activate

# Launch Airflow and its components
airflow standalone
