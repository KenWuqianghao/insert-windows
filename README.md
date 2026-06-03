# Insert for Windows

Native Windows port of **Insert**, a minimal clipboard tray inspired by Paste.

This repo contains the Windows-specific WinForms implementation. The macOS app lives at:

https://github.com/KenWuqianghao/Insert

## Features

- Bottom clipboard tray with searchable cards.
- Recent item selected automatically.
- Arrow-key navigation.
- `Enter` or `Command/Ctrl+C`-style copy behavior through the tray.
- Customizable global hotkey.
- Persistent clipboard history.
- Launch-at-startup support through the current user's `Run` registry key.

## Build

Install the .NET 8 Windows Desktop workload, then run from this repo:

```powershell
dotnet build Insert.Windows.sln
```

Run the app from Visual Studio or:

```powershell
dotnet run --project Insert.Windows/Insert.Windows.csproj
```

## Notes

This project is intended to be built and verified on Windows. The source is kept separate so the Windows release path can evolve independently from the macOS app.
