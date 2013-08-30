#!/bin/bash
find alfresco/sv_se/source -name *_??.properties -exec rm -rf {} \;
#There are som italian leftovers
find alfresco/sv_se/source -name *_it_IT.*.properties -exec rm -rf {} \;
#Delete html files
find alfresco/sv_se/source -name *.html -exec rm -rf {} \;
