package main

import (
    "os"
    "fmt"
    "io/ioutil"
)

func main() {
    inFile := os.Args[1:]
    fileInMemory := ioutil.ReadFile(inFile)
    fmt.Println(fileInMemory)
}
