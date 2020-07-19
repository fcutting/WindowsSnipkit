package main

import (
	"os"
	"fmt"
	"syscall"
	"unsafe"
)

var (
	dllKernel32       = syscall.NewLazyDLL("kernel32.dll")
	procCreateFileW   = dllKernel32.NewProc("CreateFileW")
	procReadFile      = dllKernel32.NewProc("ReadFile")
	procGetFileSize   = dllKernel32.NewProc("GetFileSize")
	procCloseHandle   = dllKernel32.NewProc("CloseHandle")
)

func main() {
	path, _ := syscall.UTF16PtrFromString(os.Args[1])

	handle, _, _ := procCreateFileW.Call(uintptr(unsafe.Pointer(path)), syscall.GENERIC_READ, 0, 0, syscall.OPEN_EXISTING, syscall.FILE_ATTRIBUTE_NORMAL, 0)
	defer procCloseHandle.Call(handle)

	fileSize, _, _ := procGetFileSize.Call(handle, 0)

	buffer := make([]byte, fileSize)
	var bytesRead *uint32

	_, _, _ = procReadFile.Call(handle, uintptr(unsafe.Pointer(&buffer[0])), uintptr(len(buffer)), uintptr(unsafe.Pointer(bytesRead)), 0)

	fmt.Println(string(buffer))
}