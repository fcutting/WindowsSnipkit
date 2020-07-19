package main

import (
	"fmt"
	"golang.org/x/sys/windows/registry"
)

func main() {
	uninstallRegLocation := "SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
	uninstallKey, _ := registry.OpenKey(registry.LOCAL_MACHINE, uninstallRegLocation, registry.ENUMERATE_SUB_KEYS)
	defer uninstallKey.Close()

	subkeyNames, _ := uninstallKey.ReadSubKeyNames(0)

	for _, subkey := range subkeyNames {
		subkeyRegLocation := uninstallRegLocation + "\\" + subkey
		subkeyKey, _ := registry.OpenKey(registry.LOCAL_MACHINE, subkeyRegLocation, registry.QUERY_VALUE)
		defer subkeyKey.Close()

		softwareName, _, _ := subkeyKey.GetStringValue("DisplayName")
		softwareVersion, _, _ := subkeyKey.GetStringValue("DisplayVersion")
		softwarePublisher, _, _ := subkeyKey.GetStringValue("Publisher")

		if len(softwareName) > 0 {
			fmt.Println(softwareName + " (" + softwarePublisher + ") v" + softwareVersion)
		}
	}
}