echo off
set projectName=%1
set clilinkpath=%2


IF  [%clilinkpath%] NEQ [] (
   cmd.exe /c npm link %clilinkpath%
)

rem generate the component
echo generating components
IF  [%projectName%]==[] (
   echo [V-CLI] cmd.exe /c ng g @magic-xpa/cli:magic
   cmd.exe /c ng g @magic-xpa/cli:magic
) ELSE (
   echo [V-CLI] cmd.exe /c ng g @magic-xpa/cli:magic --project=%projectName%
   cmd.exe /c ng g @magic-xpa/cli:magic --project=%projectName%
)
