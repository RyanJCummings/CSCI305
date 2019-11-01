package main

import (
    "os"
    "fmt"
    s "strings"
    "io/ioutil"
    "bufio"
)

// Error Checking Function
func checkError(e error){
    if e != nil {
        panic(e)
    }
}

// Function to read the input file
func readFile(file string) []byte {
    data, err := ioutil.ReadFile(file)
    checkError(err)

    return data
}

// Removes numbers from input
func processString(inStr string) string {
    inStr = s.Replace(inStr, "0", "", -1)
    inStr = s.Replace(inStr, "1",  "", -1)
    inStr = s.Replace(inStr, "2",  "", -1)
    inStr = s.Replace(inStr, "3",  "", -1)
    inStr = s.Replace(inStr, "4",  "", -1)
    inStr = s.Replace(inStr, "5",  "", -1)
    inStr = s.Replace(inStr, "6",  "", -1)
    inStr = s.Replace(inStr, "7",  "", -1)
    inStr = s.Replace(inStr, "8",  "", -1)
    inStr = s.Replace(inStr, "9",  "", -1)

    return inStr
}

// Creates output file and writes processed string
func writeOut(out []byte, fileName string) {
    err := ioutil.WriteFile(fileName, out, 0644)
    checkError(err)
}

func main() {
    inFile := os.Args[1]
    data := readFile(inFile)
    output := processString(string(data))

    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Please enter a name for your desired output file.")
    text, _ := reader.ReadString('\n')
    text = s.Replace(text, "\n", "", -1)
    text = s.Replace(text, "$", "", -1)
    writeOut([]byte(output), text)
}

