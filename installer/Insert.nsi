Unicode true

!ifndef VERSION
  !define VERSION "0.1.0"
!endif

!ifndef PUBLISH_DIR
  !define PUBLISH_DIR "..\publish\win-x64"
!endif

Name "Insert"
OutFile "..\artifacts\Insert-Windows-Setup-${VERSION}.exe"
InstallDir "$LOCALAPPDATA\Programs\Insert"
RequestExecutionLevel user

Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "Install"
  SetOutPath "$INSTDIR"
  File /r "${PUBLISH_DIR}\*.*"

  CreateDirectory "$SMPROGRAMS\Insert"
  CreateShortcut "$SMPROGRAMS\Insert\Insert.lnk" "$INSTDIR\Insert.exe"
  CreateShortcut "$SMPROGRAMS\Insert\Uninstall Insert.lnk" "$INSTDIR\Uninstall.exe"

  WriteUninstaller "$INSTDIR\Uninstall.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Insert" "DisplayName" "Insert"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Insert" "DisplayVersion" "${VERSION}"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Insert" "Publisher" "Insert"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Insert" "InstallLocation" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Insert" "DisplayIcon" "$INSTDIR\Insert.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Insert" "UninstallString" "$INSTDIR\Uninstall.exe"
  WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Insert" "NoModify" 1
  WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Insert" "NoRepair" 1
SectionEnd

Section "Uninstall"
  Delete "$SMPROGRAMS\Insert\Insert.lnk"
  Delete "$SMPROGRAMS\Insert\Uninstall Insert.lnk"
  RMDir "$SMPROGRAMS\Insert"

  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Insert"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir /r "$INSTDIR"
SectionEnd
