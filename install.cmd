@echo off

IF EXIST "%PROGRAMFILES(x86)%\gedit" (
	rem Install for GEdit 2 in Windows 64-bit
	xcopy prometeus.lang "%PROGRAMFILES(x86)%\gedit\share\gtksourceview-2.0\language-specs\" /Y /Q
	echo Installed for GEdit 2
) 

IF EXIST "%PROGRAMFILES%\gedit" ( 
	IF EXIST "%PROGRAMFILES%\gedit\share\gtksourceview-2.0" (
		rem Install for GEdit 2 in Windows 32-bit
		xcopy prometeus.lang "%PROGRAMFILES%\gedit\share\gtksourceview-2.0\language-specs\" /Y /Q
		echo Installed for GEdit 2
		goto :DONE
	) ELSE IF EXIST "%PROGRAMFILES%\gedit\share\gtksourceview-3.0" (
		rem Install for GEdit 3 in Windows 64-bit
		xcopy prometeus.lang "%PROGRAMFILES%\gedit\share\gtksourceview-3.0\language-specs\" /Y /Q
		echo Installed for GEdit 3
		goto :DONE
	)
)

echo Not installed, something wrong...
:DONE