#!/bin/bash
#-----------------------------------------------------------------------------------------------------------------
#REMOVE PACKAGES
#-----------------------------------------------------------------------------------------------------------------
rm ./*.tgz

#REMOVE INDEX.YAML
rm ./index.yaml

#-----------------------------------------------------------------------------------------------------------------
#CREATE PACKAGES
#-----------------------------------------------------------------------------------------------------------------
helm package ucd-server
helm package ucd-agent



#CREATE INDEX.YAML
helm repo index --url https://raw.githubusercontent.com/niklaushirt/urbancode_chart/master/helm/charts/repo/stable/ ./

#-----------------------------------------------------------------------------------------------------------------
#REMOVE PACKAGES in stable
#-----------------------------------------------------------------------------------------------------------------
rm ../charts/repo/stable/*.tgz


#REMOVE INDEX.YAML in charts
rm ../charts/repo/stable/index.yaml


#-----------------------------------------------------------------------------------------------------------------
#COPY PACKAGES
#-----------------------------------------------------------------------------------------------------------------
cp  ./*.tgz ../charts/repo/stable/



#COPY INDEX.YAML
cp index.yaml ../charts/repo/stable/index.yaml
