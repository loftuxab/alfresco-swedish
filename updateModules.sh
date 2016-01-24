#!/bin/bash

#Base locations of source files, chnage if you need to pull from enterprise branch
baseurl=http://svn.alfresco.com/repos/alfresco-open-mirror/

function svnget()
{
	if [ ! -d "alfresco/sv_se/source/modules/$1" ]; then
		svn co -r $3 $2 alfresco/sv_se/source/modules/$1
	else
		svn update -r $3 alfresco/sv_se/source/modules/$1
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
mkdir -p alfresco/sv_se/source/modules
if [ ! -d "alfresco/sv_se/source/modules/GoogleDocs/repo/.svn" ]; then
	#We may have a populated source dir, but we need to start from scratch for svn co/update.
	rm -rf alfresco/sv_se/source/modules/*
fi

svnget GoogleDocs/repo $baseurl/integrations/GoogleDocs/HEAD/Google%20Docs%20Repository/src/main/amp/config/alfresco/templates $rev
svnget GoogleDocs/share $baseurl/integrations/GoogleDocs/HEAD/Google%20Docs%20Share/src/main/amp/config $rev
svnget AOS/repo/module/aos-module/messages $baseurl/modules/aos-module/trunk/alfresco-aos-repo-binding/src/main/resources/alfresco/module/aos-module/messages $rev
#svnget SharePoint/sharepoint $baseurl/modules/sharepoint/amp/config/alfresco/messages $rev

git add .
git ls-files --deleted | xargs git rm
#git commit -m "Updated language source files $baseurl to revision $rev $message"
