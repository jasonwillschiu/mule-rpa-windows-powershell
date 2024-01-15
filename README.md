# How To Use
## First Run
- Download into ~/Downloads folder
- Open Powershell
- Run with ./download_and_run_tk4_server.ps1
- Folder's are setup and server is started
- Look inside the client folder, run the setup file, it'll auto open the wizard
- In the wizard, give the session a name (say sesh1). Then ip="localhost" port=3270, everything else default

These steps are optional, the RPA bot I built automatically opens the client once, presses some buttons, quits then reopens the client.
- Open the session shortcut (sesh1), it might not work the first, second or even third time. Keep opening, trying to press ENTER, ESC and F3. Quit the client, and retry until it works. It should work after 2 tries, but sometimes takes more.
- Once you get the "Logon ===>" prompt you're good to go with automating it with RPA builder

### Login details
user: HERC01
password: CUL8TR

user: HERC02
password: CUL8TR

## Next Run and resets
It's quicker to run the reset script vs deleting data inside the mainframe emulator.
- Run ./hard_reset_server.ps1

Here are some cases where you might want to do this: 
- start again from scratch
- you login with both logins and end up locked out
- deleting or modifying data

# General Instructions
https://peppe8o.com/emulating-mvs-mainframe-on-raspberry-pi/
