; NSIS Installer script for computer_interact_thing
; Output installer will be placed in build/windows/ComputerInteractInstaller.exe

Name "computer_interact_thing"
OutFile "..\..\build\windows\ComputerInteractInstaller.exe"
InstallDir "$PROGRAMFILES\computer_interact_thing"
RequestExecutionLevel admin

Page directory
Page instfiles

Section "Install"
    SetOutPath "$INSTDIR"
    File /r "..\..\build\windows\x64\runner\Release\*.*"
    CreateShortCut "$DESKTOP\computer_interact_thing.lnk" "$INSTDIR\computer_interact_thing.exe"
    
    ; Create Start Menu shortcut
    CreateDirectory "$SMPROGRAMS\computer_interact_thing"
    CreateShortCut "$SMPROGRAMS\computer_interact_thing\computer_interact_thing.lnk" "$INSTDIR\computer_interact_thing.exe"
    
    WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Uninstall"
    Delete "$DESKTOP\computer_interact_thing.lnk"
    Delete "$SMPROGRAMS\computer_interact_thing\computer_interact_thing.lnk"
    RMDir "$SMPROGRAMS\computer_interact_thing"
    Delete "$INSTDIR\computer_interact_thing.exe"
    RMDir /r "$INSTDIR"
SectionEnd
