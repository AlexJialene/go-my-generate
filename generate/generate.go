package generate

import (
	"fmt"
	//"gopkg.in/yaml.v2"
	"github.com/jinzhu/configor"
)

//var t *template.Template

func GenTemplate() {
	//generate config.yml
	configor.Load(&ConfigYml, "config.yml")
	//connect mysql
	fmt.Println(ConfigYml)
	ConnectMySql()

	//generate code
	//mysqlDB, _ := ConnectMySql()

}

func WriterToFile() {
	// var demo = &Demo{"Alex", "22"}
	// t, _ = template.ParseFiles("index.temp")
	// file, _ := os.OpenFile("demo.java", os.O_CREATE|os.O_WRONLY, 0755)

	// t.Execute(file, demo)

}

type TableColumn struct {
}
