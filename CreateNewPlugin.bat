@ECHO OFF

SET PluginTemplateFileName=ibi-plugin-template-v1
SET TemplifyLocation="c:\Program Files (x86)\endjin\Templify\Framework\TemplifyCmd.exe"
SET Args1=%1
SET NewPlugin=%Args1%
IF NOT DEFINED NewPlugin (
	ECHO =================================================================
	ECHO = Used to create a new plugin using the templify template       =
	ECHO = Enter in the name of the new plugin below and press enter     =
	ECHO =   *Note:  the plugin name cannot have a space or any other    =
	ECHO =           special characters                                  =
	ECHO =           The solution name will be IBI.***.Plugin where ***  =
	ECHO =           is the name typed in below                          =
	ECHO =================================================================
	SET /p NewPlugin="Enter New Plugin Name: "
	CLS
) 
CD ../../Plugins/
ECHO Creating the new plugin...
:: Call the templify command and create the new plugin
%TemplifyLocation% -m d -i %PluginTemplateFileName% -p IBI.%NewPlugin%.Plugin\Trunk\ -t __NAME__=%NewPlugin%
:: Delete the manifest.xml that is not needed
CD IBI.%NewPlugin%.Plugin\Trunk\
DEL manifest.xml
CD IBI.%NewPlugin%.Plugin
RMDIR /s /q packages
CLS

:: if the user had to type in a name then close it, else leave it on                                                          
IF NOT DEFINED Args1 (
	ECHO The new plugin solution has been created and can be found at
	ECHO %CD%
	ECHO Press any key to close the program                           
	PAUSE>NUL&GOTO:EOFs
)

