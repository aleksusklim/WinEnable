#NoTrayIcon
$t='WinEnable v1.0'
MsgBox(0,$t,'Bring target to front, then ALT+TAB here and press OK')
Sleep(200)
$a=WinList()
for $i=1 to $a[0][0]-1 
	if WinActive($a[$i][1]) then 
		$p=WinGetProcess($a[$i][1])	
		$w=$a[$i][0]
	EndIf
Next 
	
if MsgBox(1,$t,'Target: '&$w)<>1 then Exit

for $i=0 to $a[0][0]-1 
	if WinGetProcess($a[$i][1])=$p then
		$w=$a[$i][1]
		$s=WinGetState($w)
		if BitAND($s,3)>0 then WinSetState($w,'',@SW_ENABLE)
	EndIf
Next 
