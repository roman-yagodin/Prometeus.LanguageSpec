@echo off

IF EXIST "%PROGRAMFILES(x86)%\gedit" (
   xcopy prometeus.lang "%PROGRAMFILES(x86)%\gedit\share\gtksourceview-2.0\language-specs" /-Y
) ELSE IF EXIST "%PROGRAMFILES%\gedit" ( 
   xcopy prometeus.lang "%PROGRAMFILES%\gedit\share\gtksourceview-2.0\language-specs" /-Y
) ELSE (
   echo "Please install GEdit first."
)
