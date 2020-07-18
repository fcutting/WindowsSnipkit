package main

import (
	"os"
	"fmt"
	"syscall"
	"unsafe"
)

var (
	dllKernel32       = syscall.NewLazyDLL("kernel32.dll")
	funcCreateFileW   = dllKernel32.NewProc("CreateFileW")
	funcReadFile      = dllKernel32.NewProc("ReadFile")
	funcGetFileSize   = dllKernel32.NewProc("GetFileSize")
)

func main() {
	path, _ := syscall.UTF16PtrFromString(os.Args[1])

	handle, _, _ := funcCreateFileW.Call(uintptr(unsafe.Pointer(path)), syscall.GENERIC_READ, 0, 0, syscall.OPEN_EXISTING, syscall.FILE_ATTRIBUTE_NORMAL, 0)

	fileSize, _, _ := funcGetFileSize.Call(handle, 0)

	buffer := make([]byte, fileSize)
	var bytesRead *uint32

	_, _, _ = funcReadFile.Call(handle, uintptr(unsafe.Pointer(&buffer[0])), uintptr(len(buffer)), uintptr(unsafe.Pointer(bytesRead)), 0)

	fmt.Println(string(buffer))
}