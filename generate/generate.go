package generate

import (
	"html/template"
	"os"
)

const (
	HOST=""
	USER=""
	PASSWORD=""
)

var t *template.Template

func Generate()  {



}

func WriterToFile()  {
	demo := &Demo{"alex" , "22"}

	t,_ = template.ParseFiles("index.temp")
	file ,_ :=os.OpenFile("demo.java",os.O_CREATE|os.O_WRONLY, 0755)

	t.Execute(file ,demo)

}

type Demo struct {
	Name string
	age  string
}

