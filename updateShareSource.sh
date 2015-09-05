#!/bin/bash

#Base locations of source files, chnage if you need to pull from enterprise branch
baseurl=http://svn.alfresco.com/repos/alfresco-open-mirror/web-apps/Share/trunk

function svnget()
{
	if [ ! -d "alfresco/sv_se/source/share/$1" ]; then
		svn co -r $3 $2 alfresco/sv_se/source/share/$1
	else
		svn update -r $3 alfresco/sv_se/source/share/$1
	fi
}

#Test if we have a specific revision
if [ "$1" == "" ]; then
  	rev=HEAD
else
	rev=$1
fi
#Extra commit message
if [ "$2" == "" ]; then
  	message=""
else
	message=$2
fi

#Make sure source dir exist and is a svn
mkdir -p alfresco/sv_se/source/share
if [ ! -d "alfresco/sv_se/source/share/messages/.svn" ]; then
	#We may have a populated source dir, but we need to start from scratch for svn co/update.
	rm -rf alfresco/sv_se/source/share/*
fi

svnget web-framework-commons $baseurl/web-framework-commons/src/main/resources/alfresco $rev
svnget messages $baseurl/share/src/main/resources/alfresco/messages $rev
svnget modules $baseurl/share/src/main/resources/alfresco/site-webscripts/org/alfresco/modules $rev
svnget components $baseurl/share/src/main/resources/alfresco/site-webscripts/org/alfresco/components $rev
svnget share $baseurl/share/src/main/resources/alfresco/site-webscripts/org/alfresco/share $rev
svnget services $baseurl/share-services/src/main/resources/alfresco/templates/webscripts/org/alfresco/slingshot $rev

git add .
git ls-files --deleted | xargs git rm
#git commit -m "Updated language source files $baseurl to revision $rev $message"
