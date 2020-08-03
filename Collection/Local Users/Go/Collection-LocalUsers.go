package main

import (
	"fmt"
	"syscall"
	"unsafe"
)

var netapi32        = syscall.NewLazyDLL("netapi32.dll")
var funcNetUserEnum = netapi32.NewProc("NetUserEnum")

type USER_INFO_2 struct {
	Name                   *uint16
	Password               *uint16
	PasswordAge             uint32
	Privileges              uint32
	HomeDirectory          *uint16
	Comment                *uint16
	Flags                   uint32
	ScriptPath             *uint16
	AuthenticationFlags     uint32
	FullName               *uint16
	UserComment            *uint16
	Parameters             *uint16
	Workstations           *uint16
	LastLogon               uint32
	LastLogoff              uint32
	AccountExpires          uint32
	MaxStorage              uint32
	UnitsPerWeek            uint32
	LogonHours              uintptr
	MaxBadPasswordAttempts  uint32
	BadPasswordAttempts     uint32
	LogonServer            *uint16
	CountryuCode            uint32
	CodePage                uint32
}

func UTF16ToString(str *uint16) string {
	return syscall.UTF16ToString((*[4096]uint16)(unsafe.Pointer(str))[:])
}

func main() {
	var bufferPointer uintptr
	var entriesRead   uint32
	var totalEntires  uint32
	var resumeHandle  uintptr
	var dataSize      USER_INFO_2

	_, _, _ = funcNetUserEnum.Call(
		uintptr(0),
		uintptr(uint32(2)),
		uintptr(uint32(0x0002)),
		uintptr(unsafe.Pointer(&bufferPointer)),
		uintptr(uint32(0xffffffff)),
		uintptr(unsafe.Pointer(&entriesRead)),
		uintptr(unsafe.Pointer(&totalEntires)),
		uintptr(unsafe.Pointer(&resumeHandle)),
	)

	for i := uint32(0); i < entriesRead; i++ {
		var userData = (*USER_INFO_2)(unsafe.Pointer(bufferPointer))
		
		fmt.Println(UTF16ToString(userData.Name))

		bufferPointer = uintptr(unsafe.Pointer(bufferPointer + unsafe.Sizeof(dataSize)))
	}
}
