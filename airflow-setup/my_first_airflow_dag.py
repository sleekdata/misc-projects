from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id='my_first_airflow_dag',
    start_date=datetime(2025, 8, 1),
    schedule='@daily', 
    catchup=False,
) as dag:

    start_task = BashOperator(
        task_id='start_task',
        bash_command='echo "Starting the workflow!"',
    )

    welcome_task = BashOperator(
        task_id='welcome_task',
        bash_command='echo "Welcome, $(whoami)! This is your first Airflow DAG."',
    )

    end_task = BashOperator(
        task_id='end_task',
        bash_command='echo "Workflow completed!"',
    )

    # Define task dependencies
    start_task >> welcome_task >> end_task
