#!/bin/bash

#Base locations of source files, chnage if you need to pull from enterprise branch
baseurl=http://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root

function svnget()
{
	if [ ! -d "alfresco/sv_se/source/$1" ]; then
		svn co -r $3 $2 alfresco/sv_se/source/$1
	else
		svn update -r $3 alfresco/sv_se/source/$1
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

#Add the ignore files
if [ ! -f ".gitignore" ]; then
	echo .svn >> .gitignore
	echo *.bak >> .gitignore
	echo *.ftl >> .gitignore
	echo *.png >> .gitignore
	echo *.jar >> .gitignore
	echo *.css >> .gitignore
	echo *.acp >> .gitignore
	echo *.json >> .gitignore
	echo *.xml >> .gitignore
	echo *.html >> .gitignore
	echo *.gif >> .gitignore
	echo *.jpg >> .gitignore
	echo *.woff >> .gitignore
	echo !alfresco/sv_se/*.xml >> .gitignore
	echo !alfresco/sv_se/omegat/*.xml >> .gitignore
	echo *.js >> .gitignore
	echo !alfresco/sv_se/resources/tiny_mce/*.js >> .gitignore
	echo !alfresco/sv_se/resources/tiny_mce/*/*.js >> .gitignore
	echo !alfresco/sv_se/resources/tiny_mce/*/*/*.js >> .gitignore
	echo !alfresco/sv_se/resources/tiny_mce/*/*/*/*.js >> .gitignore
	echo !alfresco/sv_se/resources/tiny_mce/*/*/*/*/*.js >> .gitignore
	echo *.inc >> .gitignore
#Add some share extras specific ignores
	echo README.txt >> .gitignore
	echo COPYING.txt >> .gitignore
	echo MAINTAINERS.txt >> .gitignore
	echo LICENSE.* >> .gitignore
	echo _translationstatus.txt >> .gitignore
#end Share extras specific
	echo *_de.properties >> .gitignore
	echo *_DE.properties >> .gitignore
	echo *_es.properties >> .gitignore
	echo *_ES.properties >> .gitignore
	echo *_fr.properties >> .gitignore
	echo *_FR.properties >> .gitignore
	echo *_it.properties >> .gitignore
	echo *_IT.properties >> .gitignore
	echo *_IT.get.properties >> .gitignore
	echo *_ja.properties >> .gitignore
	echo *_JA.properties >> .gitignore
	echo *_ru.properties >> .gitignore
	echo *_RU.properties >> .gitignore
	echo *_us.properties >> .gitignore
	echo *_US.properties >> .gitignore
	echo *_nl.properties >> .gitignore
	echo *_NL.properties >> .gitignore
	echo *_cn.properties >> .gitignore
	echo *_CN.properties >> .gitignore
	echo *_en.properties >> .gitignore
	echo *_EN.properties >> .gitignore
	echo *_no.properties >> .gitignore
	echo *_NO.properties >> .gitignore
	echo *_nb.properties >> .gitignore
	echo *_NB.properties >> .gitignore
	echo *_br.properties >> .gitignore
	echo *_BR.properties >> .gitignore
	echo *build.properties >> .gitignore
	echo *module.properties >> .gitignore
	echo *log4j.properties >> .gitignore
	echo *alfresco-global.properties >> .gitignore
	echo *file-mapping.properties >> .gitignore
	#echo loadalf.sh >> .gitignore
	echo .DS_Store >> .gitignore
	#Ignor build and target from OmegaT project
	echo build/ >> .gitignore
	echo alfresco/sv_se/target/** >> .gitignore
	echo !alfresco/sv_se/target/.empty >> .gitignore
	echo !alfresco/sv_se/resources/** >> .gitignore
	echo alfresco/sv_se/omegat/project_stats.txt >> .gitignore
	echo alfresco/sv_se/sv_se-level1.tmx >> .gitignore
	echo alfresco/sv_se/sv_se-level2.tmx >> .gitignore
	echo alfresco/sv_se/sv_se-omegat.tmx >> .gitignore
fi

#Create Mercurial repo if not present
if [ ! -d ".git" ]; then
	git init
	git add .
	git commit -m "Initial commit"
fi

#Make sure we are on propsource branch
#BRANCHEXIST=`git branch|grep propsource|wc -l`
#if [ $BRANCHEXIST -eq 0 ]; then
#	git checkout -b propsource
#else
#	git checkout propsource
#fi


#Make sure source dir exist and is a svn
mkdir -p alfresco/sv_se/source
if [ ! -d "alfresco/sv_se/source/Repository/messages/.svn" ]; then
	#We may have a populated source dir, but we need to start from scratch for svn co/update.
	rm -rf alfresco/sv_se/source/Repository/*
fi

svnget Repository/messages $baseurl/projects/repository/config/alfresco/messages $rev
svnget Repository/scripts $baseurl/projects/remote-api/config/alfresco/ $rev
#svnget web-client $baseurl/projects/web-client/config/alfresco/messages $rev
svnget Repository/workflow $baseurl/projects/repository/config/alfresco/workflow $rev



git add .
git ls-files --deleted | xargs git rm
#git commit -m "Updated language source files $baseurl to revision $rev $message"
