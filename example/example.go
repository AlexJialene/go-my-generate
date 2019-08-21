package main

import (
	"fmt"
	"github.com/alexjialene/go-my-generate/generate"
)

func main() {
	fmt.Println("hello ")
	//generate.Hello()
	//generate.WriterToFile()
	//generate.ConnectMySql()
	//column := generate.GetColumn("t_label", "records")
	//fmt.Println(column)
	//generate.ConnectMySql()
	generate.GenTemplate()
}
