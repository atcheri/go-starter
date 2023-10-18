// Package main contains the main http, cli and graphql bootstrap code
package main

import (
	"fmt"
	"os"
)

var (
	port = "8080"
)

func init() {
	fmt.Println("===== BEGIN init function =====")
	if p := os.Getenv("PORT"); p != "" {
		port = p
	}
	fmt.Println("===== END init function =====")
}

func main() {

}
