@ECHO OFF

SET CreateNewPlugin=CreateNewPlugin.bat
SET CreateNewPluginService=CreateNewPluginService.bat
SET CurrentLocation=%CD%
ECHO ===================================================================
ECHO = Used to create a new plugin/service using the templify template =
ECHO = Enter in the name of the new plugin below and press enter       =
ECHO =   *Note:  the plugin name cannot have a space or any other      =
ECHO =           special characters                                    =
ECHO =           The solution name will be IBI.***.Plugin and          =
ECHO =            IBI.***.Service where *** is the name typed in below =
ECHO ===================================================================
SET /p NewService="Enter New Plugin/Service Name: "
CLS
ECHO %CurrentLocation%
CALL %CreateNewPlugin% %NewService%
CD "%CurrentLocation%"
CALL %CreateNewPluginService% %NewService%
CD "%CurrentLocation%"
ECHO Press any key to close the program                           
PAUSE>NUL&GOTO:EOFs

