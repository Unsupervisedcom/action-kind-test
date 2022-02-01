#!/bin/bash
set -e

dependencies=$1

mkdir dependencies && cd dependencies

for i in ${dependencies//,/ }
do
  git clone https://${GITHUB_TOKEN}@github.com/Unsupervisedcom/${i}.git
  cd $i
  skaffold run --tail --port-forward=user --verbosity=info > ${GITHUB_WORKSPACE}/skaffold-logs/${i}.txt &
done