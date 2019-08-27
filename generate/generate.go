package generate

import (
	"fmt"
	"os"
	"strings"
	"text/template"
	"time"

	//"gopkg.in/yaml.v2"
	"github.com/jinzhu/configor"
)

const OUTPUT = "./output/"
const TEMPLATE = "./template/"
const SUFFIX = ".java"

var t *template.Template

func InitConfig() {
	initOutput()
	//generate config.yml
	configor.Load(&ConfigYml, "config.yml")
	fmt.Println("[INFO] | Scan the config.yml file successfully ")
	fmt.Println("[INFO] | config.yml : ", ConfigYml)
}

func GenTemplate() {
	InitConfig()
	//connect mysql
	ConnectMySql()

	//TODO Determine if the table name is empty then generate all
	column := GetColumn()
	fmt.Println("[INFO] | Columns : ", column)

	//Assembly parameter
	a := assembly(column)
	fmt.Println("[INFO] | Assembly entity")

	writerTemplates(a)
	fmt.Println("[INFO] | Generation Success")
}

func assembly(c []Column) Assembly {
	num := len(c)
	a := Assembly{}
	//a.Date = time.Now().Format("2006-01-02 15:04:05")
	a.Date = time.Now().Format("2006-01-02")
	a.Author = ConfigYml.Author
	a.EntityName = ConfigYml.Entity
	a.LowercaseEntityName = FirstLowerCase(ConfigYml.Entity)
	a.TableName = ConfigYml.Db.Table
	a.PackageName = ConfigYml.Package

	fields := make([]Field, num)
	columns := make([]Columns, num)
	for i := 0; i < len(c); i++ {
		columns[i].Name = c[i].ColumnName
		columns[i].TypeName = c[i].DataType
		columns[i].Comment = c[i].ColumnComment

		// assembly field
		fields[i].Name = Hump(c[i].ColumnName)
		fields[i].Comment = c[i].ColumnComment
		fields[i].TypeName = DataType(c[i].DataType)
		fields[i].ColumnName = c[i].ColumnName
	}
	a.Fields = fields
	a.Columns = columns
	return a

}

func writerTemplates(assembly Assembly) {
	//write to new file to templates
	templates := ConfigYml.Templates
	for _, v := range templates {
		t, _ = template.ParseFiles(TEMPLATE + v.Template)
		fileNameNoSuffix := GetFileNameNoSuffix(v.Template)
		var simpleFileName string
		if "domain" == fileNameNoSuffix || "entity" == fileNameNoSuffix || "model" == fileNameNoSuffix {
			simpleFileName = ConfigYml.Entity
		} else {
			simpleFileName = ConfigYml.Entity + FirstCapital(Hump(fileNameNoSuffix))
		}
		fileName := OUTPUT + simpleFileName + SUFFIX
		file, _ := os.OpenFile(fileName, os.O_CREATE|os.O_WRONLY, 0755)
		t.Execute(file, assembly)
		fmt.Println("[INFO] | Generate file : ", fileName)
	}
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

func FirstLowerCase(str string) string {
	s := str[0:1]
	runes := []rune(s)
	runes[0] += 32
	return string(runes[0]) + str[1:]

}

func Hump(str string) string {
	split := strings.Split(str, "_")
	i := len(split)
	var returnStr string
	for num := 0; num < i; num++ {
		if 0 == num {
			//returnStr+=firstLowerCase(split[num])
			returnStr += split[num]
			continue
		} else {
			returnStr += FirstCapital(split[num])
		}
	}
	return returnStr

}

func FirstCapital(str string) string {
	s := str[0:1]
	runes := []rune(s)
	runes[0] -= 32
	return string(runes[0]) + str[1:]
}

func DataType(columeType string) string {
	switch columeType {
	case "varchar":
		return "String"
	case "char":
		return "String"
	case "text":
		return "String"
	case "longtext":
		return "String"
	case "bigint":
		return "Long"
	case "int":
		return "Integer"
	case "tinyint":
		return "Integer"
	case "date":
		return "LocalDate"
	case "datetime":
		return "LocalDateTime"
	case "timestamp":
		return "LocalDateTime"
	case "double":
		return "Double"
	case "decimal":
		return "BigDecimal"
	}

	fmt.Println("[ERROR] | No data type was found：", columeType)
	return ""
}

func GetFileNameNoSuffix(s string) string {
	index := strings.LastIndex(s, ".")
	return s[0:index]
}
