# challenges-data-analytics
Analytics - Code Challenge Repo

# SQL Approach
## How to Run Challenge DB
docker build -t glofox-lead-challenge-db ./

docker run -d --name my-postgresdb-container -p 5432:5432 glofox-lead-challenge-db

## How to connect to Challenge DB
URL: jdbc:postgresql://localhost:5432/glofox
USERNAME: postgres
PASSWORD: docker

# Python Approach
## Prerequisites

Python 3.9 or higher

pip (Python package installer)

## Run Project

`python main.py`

## Input

Source data CSVs found in `/data/` folder.