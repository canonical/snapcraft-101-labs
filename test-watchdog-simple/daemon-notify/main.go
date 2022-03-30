package main

import (
	"fmt"
	"time"

	"github.com/okzk/sdnotify"
)

func main() {
	loop := true
	idx := -1
	for loop {
		idx += 1
		fmt.Println("==== test-watchdog.watchdog-notify running. idx:", idx)
		if idx%3 == 0 {
			sdnotify.SdNotify("WATCHDOG=1")
			fmt.Println("==== test-watchdog.watchdog-notify IS notified on watchdog")
		}
		time.Sleep(1 * time.Second)
	}
}
