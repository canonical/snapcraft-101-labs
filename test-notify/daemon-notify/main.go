package main

import (
	"fmt"
	"os"
	"time"

	"github.com/okzk/sdnotify"
)

func main() {
	snap := os.Getenv("SNAP_NAME")
	loop := true
	idx := -1
	for loop {
		idx += 1
		fmt.Printf("==== %s.notify running. idx: %v\n", snap, idx)
		if idx == 5 {
			break
		}
		time.Sleep(1 * time.Second)
	}
	fmt.Printf("==== %s.notify ABOUT TO NOTIFY\n", snap)
	sdnotify.SdNotify("READY=1")
	fmt.Printf("==== %s.notify NOTIFY COMPLETED\n", snap)

	time.Sleep(5 * time.Second)
}
