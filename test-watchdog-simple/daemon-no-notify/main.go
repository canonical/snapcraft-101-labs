package main

import (
	"fmt"
	"time"
)

func main() {
	loop := true
	idx := -1
	for loop {
		idx += 1
		fmt.Println("==== test-watchdog.watchdog-no-notify running. idx:", idx)
		if idx%3 ==0 {
			fmt.Println("==== test-daemon NOT notified on watchdog")
		}
		time.Sleep(1 * time.Second)
	}
}
