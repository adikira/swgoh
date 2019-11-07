#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
#Persistent
#InstallKeybdHook
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2

global globalSleep = 900

startSwgoh()  
infLoop()  

;;;;;;;;;;; FUNCTIONS ;;;;;;;;;;;;;

infLoop()
{
  while 1
  {
    allyPointsLoop()
  }
}

allyPointsLoop()
{
    sendK("Q", 0.01)  ; This "Q" needs to match what is setup in NOX
}

sendK(key, slp:="")
  {
    global GlobalSleep  ; if declared with global globally it may not need global here
    if (slp == "")
      {
        slp = %GlobalSleep%
      }
    else
      {
        slp := slp*1000
      }
    Sleep %slp%
    ; MsgBox, slp = %slp%, GlobalSleep = %GlobalSleep%, key = %key%
    if (key <> "")
      SendInput %key%
  }

startWin(class, path, args:="")
{
	;MsgBox, _IfWinExist, ahk_class %class% [path = %path%; A_ComputerName = %A_ComputerName%]
	IfWinExist, ahk_class %class%
	{
		WinActivate
		; WinMaximize, A
	}
	else
        {
		if (args = "")
		{
			; MsgBox, path = %path%`, args (null) = %args%
			Run "%path%", , Max
		}
		else
		{
			Run "%path%" "%args%", , Max
			;MsgBox, path = %path%`, args = %args%
		}
		; MsgBox, path = %path%`, args = %args%
		WinMaximize, A
                MsgBox, Launch SWGOH in NOX and go to the store, bronzium data card screen. Then relaunch this script.
                ExitApp 
        }
}


startSwgoh()
{
    startWin("Qt5QWindowIcon", "%APPDATA%\Microsoft\Windows\Start Menu\Nox\Nox.lnk")
}

^!+s:: ; ^=Ctrl, !=Alt, +=Shift -> Ctrl+Alt+Shift+S stops script. You can customize it here. Look at ahk documentation for more info.
    MsgBox, Stop script ; if you don't need the popup confirmation comment it out with ";" in front of the line
    ExitApp 
return

