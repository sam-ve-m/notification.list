fission spec init
fission env create --spec --name notification-list-env --image nexus.sigame.com.br/fission-notification-list:0.1.0-2 --poolsize 0 --version 3 --imagepullsecret "nexus-v3" --spec
fission fn create --spec --name notification-list-fn --env notification-list-env --code fission.py --targetcpu 80 --executortype newdeploy --maxscale 3 --requestsperpod 10000 --spec
fission route create --spec --name notification-list-rt --method GET --url /notification/list --function notification-list-fn
