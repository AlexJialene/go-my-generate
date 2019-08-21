package main

import (
	"fmt"
	"strings"
)

func main() {
	fmt.Println("hello ")
	//generate.Hello()
	//generate.WriterToFile()
	//generate.ConnectMySql()
	//column := generate.GetColumn("t_label", "records")
	//fmt.Println(column)
	//generate.ConnectMySql()
	//generate.GenTemplate()
	s := "newsid"
	split := strings.Split(s, "_")
	for _, v := range split {
		fmt.Println(v)
	}
}

func Capitalize(str string) string {
	s := str[0:1]
	runes := []rune(s)
	runes[0] += 32
	return string(runes[0]) + str[1:]
}
