toggle := false

; Create the GUI window
Gui, +AlwaysOnTop -SysMenu +ToolWindow
Gui, Font, s12 Bold, Verdana
Gui, Add, Text, vToggleStatus w150 Center, AutoFarm: OFF
Gui, Show, x20 y20, AutoFarm Status

F6::
toggle := !toggle
if (toggle) {
    GuiControl,, ToggleStatus, AutoFarm: ON
    SetTimer, AutoFarmLoop, 10
} else {
    GuiControl,, ToggleStatus, AutoFarm: OFF
    SetTimer, AutoFarmLoop, Off
}
return

AutoFarmLoop:
SetTimer, AutoFarmLoop, Off  ; Stop the timer to prevent re-entry

; 5x Left Click Press (2000ms before each click, 750ms hold, 2000ms after release)
Loop, 5 {
    Sleep, 2000
    Click Down
    Sleep, 750
    Click Up
    Sleep, 2000
}

; Hold W for 1200ms, then wait 1 second
Send {w Down}
Sleep, 1200
Send {w Up}
Sleep, 1000

; Short left click
Click

; Wait 1.4 seconds before long left click
Sleep, 1400

; Hold Left Click for 18000ms, then wait 1 second
Click Down
Sleep, 18000
Click Up
Sleep, 1000

; Hold S for 1200ms, then wait 1 second
Send {s Down}
Sleep, 1200
Send {s Up}
Sleep, 1000

if toggle  ; If toggle is still ON, restart timer to repeat
    SetTimer, AutoFarmLoop, 10

return

GuiClose:
GuiEscape:
    ExitApp
