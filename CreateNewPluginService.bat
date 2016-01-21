@ECHO OFF

SET ServiceTemplateFileName=ibi-plugin-service-template-v1
SET TemplifyLocation="c:\Program Files (x86)\endjin\Templify\Framework\TemplifyCmd.exe"
SET Args1=%1
SET NewService=%Args1%
IF NOT DEFINED NewService (
	ECHO ===================================================================
	ECHO = Used to create a new plugin service using the templify template =
	ECHO = Enter in the name of the new service below and press enter      =
	ECHO =   *Note:  the plugin name cannot have a space or any other      =
	ECHO =           special characters                                    =
	ECHO =           The solution name will be IBI.***.Service where ***   =
	ECHO =           is the name typed in below                            =
	ECHO ===================================================================
	SET /p NewService="Enter New Plugin Service Name: "
	CLS
) 
CD ../../Services/
ECHO Creating the new service...
:: Call the templify command and create the new service
%TemplifyLocation% -m d -i %ServiceTemplateFileName% -p IBI.%NewService%.Service\Trunk\ -t __NAME__=%NewService%
:: Delete the manifest.xml that is not needed
CD IBI.%NewService%.Service\Trunk\
DEL manifest.xml
RMDIR /s /q packages
CLS
 
:: if the user had to type in a name then close it, else leave it on                                                          
IF NOT DEFINED Args1 (
	ECHO The new plugin service solution has been created and can be found at
	ECHO %CD% 
	ECHO Press any key to close the program                           
	PAUSE>NUL&GOTO:EOFs
)

