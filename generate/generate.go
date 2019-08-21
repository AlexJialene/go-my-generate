package generate

import (
	"fmt"
	"html/template"
	"os"
	"strings"

	//"gopkg.in/yaml.v2"
	"github.com/jinzhu/configor"
)

const OUTPUT = "./output/"
const TEMPLATE = "./template/"

var t *template.Template

func GenTemplate() {
	initOutput()
	//generate config.yml
	configor.Load(&ConfigYml, "config.yml")
	fmt.Println("[INFO] | Scan the config.yml file successfully ")
	fmt.Println("[INFO] | config.yml : ", ConfigYml)
	//fmt.Printf("[INFO] | config: %#v", ConfigYml)

	//connect mysql
	ConnectMySql()
	//
	column := GetColumn(ConfigYml.Db.Table, ConfigYml.Db.Database)
	fmt.Println("[INFO] | columns : ", column)

	//Assembly parameter
	fmt.Println(assembly(column))

	//writerToFile()

}

func assembly(c []Column) Assembly {
	num := len(c)
	a := Assembly{}
	a.entityName = ConfigYml.Entity
	a.lowercaseEntityName = firstLowerCase(ConfigYml.Entity)
	a.tableName = ConfigYml.Db.Table
	a.packageName = ConfigYml.Package

	fields := make([]Field, num)
	columns := make([]Columns, num)
	for i := 0; i < len(c); i++ {
		columns[i].name = c[i].ColumnName
		columns[i].typeName = c[i].DataType
		columns[i].comment = c[i].ColumnComment
		// assembly field

	}
	a.fields = fields
	a.columns = columns

	return a

}

func writerToFile() {
	//TODO
	table := TableColumn{Table: "this is table name"}
	t, _ = template.ParseFiles("controller.t")
	file, _ := os.OpenFile("./output/demo.java", os.O_CREATE|os.O_WRONLY, 0755)

	t.Execute(file, table)

}

func initOutput() {
	//if the dir not exist then mkdir it
	_, e := os.Stat(OUTPUT)
	if os.IsNotExist(e) {
		os.Mkdir(OUTPUT, os.ModePerm)
	}
	_, err := os.Stat(TEMPLATE)
	if os.IsNotExist(err) {
		os.Mkdir(TEMPLATE, os.ModePerm)
	}
}

func firstLowerCase(str string) string {
	s := str[0:1]
	runes := []rune(s)
	runes[0] += 32
	return string(runes[0]) + str[1:]

}

func hump(str string) string {
	split := strings.Split(str, "_")
	i := len(split)
	if 1 > i {

	} else {

	}

}

type TableColumn struct {
	Table string
}
