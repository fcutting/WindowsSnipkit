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
)

func main() {
	_, _, _ = procOpenClipboard.Call(0)

	handle, _, _ := procGetClipboardData.Call(13)

	lock, _, _ := procGlobalLock.Call(handle)

	text := syscall.UTF16ToString((*[1 << 20]uint16)(unsafe.Pointer(lock))[:])

	_, _, _ = procGlobalUnlock.Call(handle)

	procCloseClipboard.Call()

	fmt.Println(text)
}