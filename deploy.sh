#!/bin/bash
fission spec init
fission env create --spec --name notification-list-env --image nexus.sigame.com.br/fission-async:0.1.9 --builder nexus.sigame.com.br/fission-builder-3.8:0.0.1
fission fn create --spec --name notification-list-fn --env notification-list-env --src "./func/*" --entrypoint main.get_all_notifications --executortype newdeploy --maxscale 1
fission route create --spec --name notification-list-rt --method GET --url /notifications/get_all --function notification-list-fn