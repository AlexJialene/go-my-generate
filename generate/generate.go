package generate

import (
	"fmt"
	"html/template"
	"os"

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
	assembly(column)
	writerToFile()

}

func assembly(columns []Column) {
	a := Assembly{}
	a.entityName = ConfigYml.Entity
	a.lowercaseEntityName = ""
	a.tableName = ConfigYml.Db.Table
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

type TableColumn struct {
	Table string
}
