@echo off
REM Step 1: Download Python 3.11 installer silently
echo Downloading Python 3.11...
curl --ssl-no-revoke -o python311-installer.exe https://www.python.org/ftp/python/3.11.7/python-3.11.7-amd64.exe

REM Step 2: Install Python 3.11 (adjust path if needed)
echo Installing Python 3.11...
python311-installer.exe /quiet InstallAllUsers=0 TargetDir=%USERPROFILE%\python311 Include_launcher=0

REM Step 3: Create virtual environment
echo Creating virtual environment...
REM Explicitly call python3.11.exe from the target dir
%USERPROFILE%\python311\python.exe -m venv venv-py311

REM Step 4: Activate the virtual environment
call venv-py311\Scripts\activate

REM Step 5: Install your project dependencies
pip install --upgrade pip
pip install cassandra-driver google-cloud-pubsub

echo Setup complete! Python 3.11 virtualenv is ready 🚀
cmd /k