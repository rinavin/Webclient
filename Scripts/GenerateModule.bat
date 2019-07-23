echo off
set projectName=%1
set clilinkpath=%2


IF  [%clilinkpath%] NEQ [] (
   echo [V-CLI] npm link %clilinkpath%
   cmd.exe /c npm link %clilinkpath%
)

rem generate the module
echo generating modules
IF  [%projectName%]==[] (
   echo [V-CLI] cmd.exe /c ng g @magic-xpa/cli:modules
   cmd.exe /c ng g @magic-xpa/cli:modules
) ELSE (
   echo [V-CLI] cmd.exe /c ng g @magic-xpa/cli:modules --project=%projectName%
   cmd.exe /c ng g @magic-xpa/cli:modules --project=%projectName%
)
