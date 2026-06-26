# jedha-mlworkflow

## build et lancement du mlflow ui 
docker build . -t jedha-mlworkflow:0.1.0
docker run -p  5000:5000 -e PORT=5000 jedha-mlworkflow:0.1.0

## lancement de train.py en local
export APP_URI=http://localhost:5000
python train.py