; Prometeus.LanguageSpec.nsi

; The name of the installer
Name "Prometeus.LanguageSpec"

; The file to write
OutFile "Prometeus.LanguageSpec_Install.exe"

; The default installation directory
InstallDir $PROGRAMFILES\Prometeus.LanguageSpec

; Registry key to check for directory (so if you install again, it will 
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\R7\Prometeus.LanguageSpec" "Install_Dir"

; Request application privileges for Windows Vista
RequestExecutionLevel admin

; Compressor options
SetCompressor lzma

; Pages
Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

; Prometeus.LanguageSpec
Section "!Prometeus.LanguageSpec"
	
	SectionIn RO
		
	; Set output path to the installation directory.
	SetOutPath $INSTDIR
    File "prometeus.lang"
	File "README.md"
	File "LICENSE.md"
	File "install.cmd"
	
	; Write the installation path into the registry
  	WriteRegStr HKLM SOFTWARE\R7\Prometeus.LanguageSpec "Install_Dir" "$INSTDIR"
  
  	; Write the uninstall keys for Windows
  	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Prometeus.LanguageSpec" "DisplayName" "Prometeus.LanguageSpec"
  	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Prometeus.LanguageSpec" "UninstallString" '"$INSTDIR\uninstall.exe"'
  	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Prometeus.LanguageSpec" "NoModify" 1
 	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Prometeus.LanguageSpec" "NoRepair" 1
  	WriteUninstaller "uninstall.exe"

SectionEnd

; GEdit 2
Section "!GEdit 2 (32-bit, stable)"

	SetOutPath $INSTDIR\gedit
	
    File "gedit\gedit-setup-2.30.1-1.exe"
    ExecWait "gedit\gedit-setup-2.30.1-1.exe"

	; Copy to GEdit language specs
	SetOutPath "$PROGRAMFILES\gedit\share\gtksourceview-2.0\language-specs"
	File "prometeus.lang"

SectionEnd
 
; GEdit 3
Section /o "GEdit 3 (64-bit, latest and innovative)"

	SetOutPath $INSTDIR\gedit

	File "gedit\gedit-x86_64-3.13.4.exe"
	ExecWait "gedit\gedit-x86_64-3.13.4.exe"	
	
	; Copy to GEdit language specs
	SetOutPath "$PROGRAMFILES64\gedit\share\gtksourceview-3.0\language-specs"
	File "prometeus.lang"

SectionEnd

; Uninstaller
Section "Uninstall"
  
	; Remove registry keys
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Prometeus.LanguageSpec"
	DeleteRegKey HKLM SOFTWARE\R7\Prometeus.LanguageSpec
 
	; Delete files
	Delete "$INSTDIR\*.*"
	Delete "$INSTDIR\gedit\*.*"
	
	; Remove directories used
	RMDir "$INSTDIR\gedit"
	RMDir "$INSTDIR"

SectionEnd
