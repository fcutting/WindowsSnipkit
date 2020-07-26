package main

import (
    "fmt"
    "syscall"
    "unsafe"
)

var (
    dllUser32            = syscall.NewLazyDLL("user32.dll")
    procOpenClipboard    = dllUser32.NewProc("OpenClipboard")
    procCloseClipboard   = dllUser32.NewProc("CloseClipboard")
    procGetClipboardData = dllUser32.NewProc("GetClipboardData")
    
    dllKernel32      = syscall.NewLazyDLL("kernel32.dll")
    procGlobalLock   = dllKernel32.NewProc("GlobalLock")
    procGlobalUnlock = dllKernel32.NewProc("GlobalUnlock")
    procCloseHandle  = dllKernel32.NewProc("CloseHandle")
)

func main() {
    _, _, _ = procOpenClipboard.Call(0)
    defer procCloseClipboard.Call()
    
    handle, _, _ := procGetClipboardData.Call(13)
    defer procCloseHandle.Call(handle)
    
    lock, _, _ := procGlobalLock.Call(handle)
    defer procGlobalUnlock.Call(handle)
    
    text := syscall.UTF16ToString((*[1 << 20]uint16)(unsafe.Pointer(lock))[:])
    
    fmt.Println(text)
}
