package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
	snap := os.Getenv("SNAP_NAME")
	loop := true
	idx := -1
	for loop {
		idx += 1
		fmt.Printf("==== %s.no-notify running. idx: %v\n", snap, idx)
		if idx == 5 {
			break
		}
		time.Sleep(1 * time.Second)
	}
}
