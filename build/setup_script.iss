; Inno Setup Script

#define MyAppName "BF2.TV"
#define MyAppVersion "0.0.0.3"
#define MyAppPublisher "TwitchPlaysBF2"
#define MyAppURL "https://www.github.com/TwitchPlaysBF2"
#define MyAppExeName "BF2Dashboard.WindowsApp.exe"

[Setup]
AppId={{160D7F45-1026-4216-8CCD-217D7A40C1B2}
AppName={#MyAppName}
VersionInfoVersion={#MyAppVersion}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} v{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\BF2.TV
DisableProgramGroupPage=yes
OutputDir=/bin
OutputBaseFilename=BF2.TV_App_Setup
SetupIconFile=..\src\BF2Dashboard.UI\wwwroot\favicon.ico
Compression=lzma2/max
SolidCompression=yes
WizardStyle=classic

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "..\src\BF2Dashboard.WindowsApp\bin\Release\net6.0-windows\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "redistributables\*"; DestDir: "{app}\_external"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\_external\joinme.click-launcher.exe"; Parameters: "-quiet"
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
