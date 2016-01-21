@ECHO OFF
:: Create the variables used through out the batch script
SET ServiceTemplateFileName=ibi-plugin-service-template-v1.pkg
SET PluginTemplateFileName=ibi-plugin-template-v1.pkg
SET RepoLocation=%userprofile%\APPDATA\Roaming\endjin\Templify\repo
SET ServiceTemplate=%RepoLocation%\%ServiceTemplateFileName%
SET PluginTemplate=%RepoLocation%\%PluginTemplateFileName%

:: Test if the repo location exists and if not user needs to install templify
IF EXIST %RepoLocation% (
	:: delete the service template if the file exists
	IF EXIST %ServiceTemplate% (
		ECHO Deleteing Original Service Template
		del %ServiceTemplate%
	)
	
	:: delete the plugin template if the file exists
	IF EXIST %PluginTemplate% (
		ECHO Deleteing Original Plugin Template
		del %PluginTemplate%
	)
	
	:: copy the .pkg files in the current location to the rep
	COPY /Y *.pkg %RepoLocation%
) ELSE (
	:: echo instructions if the repo folder doesn't exists
	ECHO Please Install Templify before installing the templates
)

:: wait for user to press a key to close out the command window
ECHO.&ECHO.Press any key to end the application.
PAUSE>NUL&GOTO:EOFs