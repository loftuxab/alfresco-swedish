SWEDISH LANGUAGE PACK
Release @@edition@@ @@version@@

This release is targeted at the Alfresco @@edition@@ version. It may or may not
work with Alfresco Enterprise version.

To make this release available, time and effort has been donated by
Peter Löfgren, Loftux AB, http://loftux.se
Redpill Linpro AB, http://www.redpill-linpro.se

In this package you will find two install options, one quick install with jar
file, one with two amp-files plus supporting files.

It is recommended that you backup you system before proceeding and to test in
a test environment before installing into production system.

* InstallOption1 (preferred) *
1. Copy the file share_sv_SE-@@version@@-@@edition@@.jar found in folder
InstallOption1 to tomcat/shared/lib. If that folder does not exist, you can 
create it.
2. Restart Alfresco, and you should have Swedish available as a language option
for both Alfresco Share and Alfresco Explorer.

For Alfresco Explorer client the jar file includes configuration to make Swedish
available. If you use your own web-client-config-custom.xml you may have to
follow step 6 under InstallOption2

* InstallOption2 *
You will need to install both files to get a complete translation.
Installation is a bit different for Alfresco repository and Share client, so
please follow instructions below.

1. Stop your Alfresco application server.
2. Drop the alfresco_sv_SE-@@version@@-@@edition@@.amp into the amps subdirectory.
3. Create a subdirectory to you Alfresco install directory called amps-share
   (if it does not exist). Note the spelling of amps-share directory.
4. Drop the share_sv_SE-@@version@@-@@edition@@.amp into the amps-share subdirectory.
5. Run the apply_amps.sh or apply_amps.bat file to install the Swedish
   translation module. It will install for both Alfresco Explorer and Share.
6. Update shared/classes/alfresco/extension/web-client-config-custom.xml.

   <config evaluator="string-compare" condition="Languages" replace="true">
      <languages>
	<language locale="sv_SE">Swedish</language>         
	<language locale="en_US">English</language> 
      </languages>
   </config>

Note: This is a sample configuration, you may of course have more or less
languages in the file. You have to use the replace="true" directive in order
to replace Alfresco default configuration.

7. Start you Alfresco application server.

* Alfresco Share - select language *
For Alfresco Share client, it detects the language preferences set in the
options dialog for your browser. Consult the help file for your browser and
set [sv] or [sv_SE] as your topmost preferred language.

* Known issues *
SHARE
If your locale is non-english, ie you have in 
JAVA_OPTS -Duser.language=sv -Duser.country=SE
you will be unable to display the standard default english user interface.
Workaround: Use -Duser.language=en -Duser.country=US in JAVA_OPTS or if you 
need Swedish for Alfresco repository, install Alfresco Share on separate Tomcat.
https://issues.alfresco.com/jira/browse/ALF-2921

TinyMCE not displayed in Swedish when used in forms
http://issues.alfresco.com/jira/browse/ALF-5567

Please report your findings in the issue tracker:
http://code.google.com/p/alfresco-swedish/issues/list

* Terminology and spelling *
For the translation to be consistent a terminology file has been created.
There may be inconsistencies, please report them if you find any.
If you have other suggestions, or find spelling errors please feel free to 
discuss the in the forum.

* Customisation *
If you need to adapt this translation for you speciall needs you can do so
by editing using a text editor or follow this guide
http://code.google.com/p/alfresco-swedish/w/list

* Current maintainers *
Peter Löfgren		Loftux AB - http://loftux.se
Niklas Ekman		Redpill Linpro AB - http://www.redpill-linpro.com

Based on work in the Swedish translation project
http://forge.alfresco.com/projects/languagesv/

Johannes Tyve		Sveriges geologiska undersökning
Patrik Bergström	Monator
Alexandra Larsson	RFSL
Anders Nygårds		Cad-Q
Johan Börjesson		Infomega

* TinyMCE translation *
This release has translation files for TinyMCE Swedish (sv) included.
Translated files has been downloaded from http://tinymce.moxiecode.com
Any changes you require to translations need to be communicated to tinyMCE
maintainers. TinyMCE i licensed by LGPL, http://tinymce.moxiecode.com/license.php
