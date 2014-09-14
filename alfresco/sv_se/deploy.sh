#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 {version} {is Release true/false}"
    exit 0
fi

url=http://artifacts.loftux.net/nexus/content/repositories/

if [ "$2" = "true" ]; then
  version=$1
  url=$url"releases"
else
  version=$1"-SNAPSHOT"
  url=$url"snapshots"
fi

isRelease=$2

shareamp=( $(find build -name share*.amp))
alfrescoamp=( $(find build -name alfresco*.amp))

mvn deploy:deploy-file\
 -Durl=$url\
 -DgroupId=se.loftux.alfresco.i18n\
 -DartifactId=share-sv-se\
 -Dversion=$version\
 -DuniqueVersion=true\
 -Dpackaging=amp\
 -Dfile=$shareamp\
 -DrepositoryId=loftux\

mvn deploy:deploy-file\
 -Durl=$url\
 -DgroupId=se.loftux.alfresco.i18n\
 -DartifactId=alfresco-sv-se\
 -Dversion=$version\
 -DuniqueVersion=true\
 -Dpackaging=amp\
 -Dfile=$alfrescoamp\
 -DrepositoryId=loftux\
