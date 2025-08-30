**Option 1: **

Copy the individual commands from airflow-setup.sh and airflow-start.sh one by one, and run them in your Ubuntu terminal.





**Option 2: **

Create script files to set up Airflow (Executable scripts in one go).



1\) Create the script files in your home directory



cat > ~/airflow-setup.sh

\# Copy and paste the contents of airflow-setup.sh

\# Press Ctrl+D to save



cat > ~/airflow-start.sh

\# Copy and paste the contents of airflow-start.sh

\# Press Ctrl+D to save



2\) Make the scripts executable

chmod +x ~/airflow-setup.sh ~/airflow-start.sh



3\) Run airflow-setup.sh to set up Airflow (run once):

~/airflow-setup.sh



4\) Run airflow-start.sh to start Airflow (run every time you want to start Airflow):

~/airflow-start.sh

