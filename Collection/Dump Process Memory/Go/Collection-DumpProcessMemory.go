package main

import (
    "fmt"
    "os"
    "strconv"
    "syscall"
    "unsafe"
)

var (
    dllKernel32     = syscall.NewLazyDLL("kernel32.dll")
    procOpenProcess = dllKernel32.NewProc("OpenProcess")
    procCreateFileW = dllKernel32.NewProc("CreateFileW")
    
    dllDbghelp            = syscall.NewLazyDLL("Dbghelp.dll")
    procMiniDumpWriteDump = dllDbghelp.NewProc("MiniDumpWriteDump")
)

func main() {
    pid, _ := strconv.Atoi(os.Args[1])
    
    processHandle, _, _ := procOpenProcess.Call(uintptr(0xFFFF), uintptr(1), uintptr(pid))
    
    if _, err := os.Stat(os.Args[2]); os.IsNotExist(err) {
        os.Create(os.Args[2])
    }
    
    path, _ := syscall.UTF16PtrFromString(os.Args[2])
    
    fileHandle, _, _ := procCreateFileW.Call(uintptr(unsafe.Pointer(path)), syscall.GENERIC_WRITE, syscall.FILE_SHARE_READ|syscall.FILE_SHARE_WRITE, 0, syscall.OPEN_EXISTING, syscall.FILE_ATTRIBUTE_NORMAL, 0)
    
    ret, _, err := procMiniDumpWriteDump.Call(uintptr(processHandle), uintptr(pid), uintptr(fileHandle), 0x00061907, 0, 0, 0)
    
    if ret != 0 {
        fmt.Println("Process memory dump successful")
    } else {
        fmt.Println("Process memory dump failed")
        fmt.Println(err)
    }
}
