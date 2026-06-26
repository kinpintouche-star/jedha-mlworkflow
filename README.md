# jedha-mlworkflow

## build et lancement du mlflow ui 
docker build . -t jedha-mlworkflow:0.1.0
docker run -p  5000:5000 -e PORT=5000 jedha-mlworkflow:0.1.0

##avec base postgres extrnalisé
docker build . -t jedha-mlworkflow:0.2.0
docker run -p 5000:5000 -e PORT=5000 -e BACKEND_STORE_URI="postgresql://neondb_owner:xxxxxx.eu-west-2.aws.neon.tech/neondb?sslmode=require" jedha-mlworkflow:0.2.0

## lancement de train.py en local
export APP_URI=http://localhost:5000
python train.py