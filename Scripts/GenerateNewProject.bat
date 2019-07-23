echo off
set outputdir=%1
set projectName=%2
set cliVersion=%3
set angularVersion=%4
set clilinkpath=%5


rem make Angular generate the new project
echo generating new project "%projectName%"
IF [%clilinkpath%]==[] (
	rem create the directory
 	mkdir  %outputdir%
 	chdir /d %outputdir%
  
    echo Install angular/cli@8 - Installing angular/cli version 8
    cmd.exe /c npm i @angular/cli@8

 	cmd.exe /c ng new %projectName% --skip-git
 	chdir %projectName% 
) ELSE (
	chdir /d %outputdir%

	IF "%clilinkpath%"== "workspace" (
		cmd.exe /c ng g application %projectName%
	) ELSE (
		attrib -r angular.json
		attrib -r package.json
		cmd.exe /c ng g application %projectName%
		cmd.exe /c npm link %clilinkpath%
	)
)

rem add Magic's project
echo adding Magic support`
IF [%clilinkpath%] == [] (
   echo [V-CLI] cmd.exe /c ng add @magic-xpa/cli@%cliVersion% --project=%projectName% --skipHelp --angularVersion=%angularVersion% --cliVersion=%cliVersion%
   cmd.exe /c ng add @magic-xpa/cli@%cliVersion% --project=%projectName% --skipHelp --angularVersion=%angularVersion% --cliVersion=%cliVersion%
) ELSE (
   IF "%clilinkpath%"== "workspace" (
      echo [V-CLI] cmd.exe /c ng add @magic-xpa/cli --project=%projectName% --skipHelp --angularVersion=%angularVersion% --cliVersion=%cliVersion%
      cmd.exe /c ng add @magic-xpa/cli@%cliVersion% --project=%projectName% --skipHelp --angularVersion=%angularVersion% --cliVersion=%cliVersion%
   ) ELSE (
      echo [V-CLI] cmd.exe /c ng add @magic-xpa/cli@%cliVersion% --project=%projectName% --skipHelp --angularVersion=%angularVersion% --cliVersion=%cliVersion%
      cmd.exe /c ng add @magic-xpa/cli --project=%projectName% --skipHelp --angularVersion=%angularVersion% --cliVersion=%cliVersion%   
   )

)




IF [%clilinkpath%] == [] (
  cmd.exe /c npm i 
) ELSE (
	IF [%clilinkpath%] NEQ "workspace" (
		cmd.exe /c npm i 
	) ELSE (
		cmd.exe /c npm link %clilinkpath%
	)
)

