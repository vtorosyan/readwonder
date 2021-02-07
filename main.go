package main

import (
	"log"
	"os"

	rice "github.com/GeertJohan/go.rice"
	"github.com/vtorosyan/readwonder/pkg"
)

func main() {
	if _, err := os.Stat("app/build"); os.IsExist(err) {
		log.Printf("initializing the box %s", "app/build")
		if _, err := rice.FindBox("app/build"); err != nil {
			log.Fatalf("error initializing the box %v", err)
		}

	}
	api.Start()
}
