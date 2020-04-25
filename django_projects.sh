#!/usr/bin/env bash

# comment: use command ./[file_name].sh
# comment: or command chmod 0755 [file_name].sh

# project folder
STDIN_LEN=${#*} # STDIN length

# check for arguments
if [[ $STDIN_LEN == 0 ]]; then
  echo please provide [FOLDER_NAME] with command
  exit
fi

if [[ $STDIN_LEN < 3 ]]; then
  echo please provide [PROJECT_NAME] and [PROJECT_APP] with command
  exit
fi

PROJECT_FOLDER=$1
PROJECT_NAME=$2
PROJECT_APP=$3


# make folder
echo ...
echo making folder - $PROJECT_FOLDER
mkdir $PROJECT_FOLDER
echo Folder: $PROJECT_FOLDER created
echo ...

function start_django() {
  # change directory
  echo changing directory to folder: $PROJECT_FOLDER
  cd $PROJECT_FOLDER
  echo ...

  # virtual environment
  echo initiating virtual environment
  virtualenv venv -p python3
  source venv/bin/activate
  echo ...

  # atom IDE
  echo opening project in ATOM IDE
  atom .
  echo ...

  # install django
  # install pillow
  echo installing django
  pip install django
  echo ...
  echo django installed
  echo ...
  echo installing Pillow
  echo ...
  pip install Pillow
  echo ...
  echo Pillow installed
  echo ...

  # start django project
  echo starting django project: $PROJECT_NAME
  django-admin startproject $PROJECT_NAME
  echo ...

  # change to django project directory
  echo changing to project [$PROJECT_NAME] directory
  cd $PROJECT_NAME
  echo ...

  echo creating first app
  django-admin startapp $PROJECT_APP
  echo ...

  echo freezing requirements
  pip freeze > requirements.txt
}

start_django

echo ...
echo done
echo ...
