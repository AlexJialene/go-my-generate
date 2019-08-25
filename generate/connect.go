package generate

import (
	"fmt"
	"time"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

const (
	USERNAME = "root"
	PASSWORD = "123456"
	NETWORK  = "tcp"
	SERVER   = "127.0.0.1"
	PORT     = 3306
	DATABASE = "records?charset=utf8&parseTime=True&loc=Local"
)

var mysqlDB *gorm.DB

func ConnectMySql() {
	dsn := fmt.Sprintf("%s:%s@%s(%s:%d)/%s?charset=utf8", ConfigYml.Db.User, ConfigYml.Db.Password, NETWORK, ConfigYml.Db.Host, ConfigYml.Db.Port, ConfigYml.Db.Database)
	db, err := gorm.Open("mysql", dsn)
	//defer db.Close()
	if err != nil {
		fmt.Println("[ERROR] | connect mysql error: ", err)
		return
	}
	db.DB().SetConnMaxLifetime(100 * time.Second) //最大连接周期，超过时间的连接就close
	db.DB().SetMaxOpenConns(100)                  //设置最大连接数
	db.DB().SetMaxIdleConns(16)                   //设置闲置连接数
	db.Debug()
	db.LogMode(true)

	mysqlDB = db
	fmt.Println("[INFO] | connect mysql success")
	//return db, nil

}

func GetColumn() []Column {
	tableName := ConfigYml.Db.Table
	schema := ConfigYml.Db.Database
	fmt.Println("[INFO] | get columns in table name :", tableName)
	var column []Column
	mysqlDB.Table("information_schema.columns").Select("column_name,column_comment,data_type").Where("table_name=? and table_schema=?", tableName, schema).Find(&column)
	return column

}

func GetTables() []Tables {
	fmt.Println("[INFO] | get columns in table name :", ConfigYml.Db.Database)
	var tables []Tables
	mysqlDB.Table("information_schema.tables").Select("table_name").Where("table_schema=?", ConfigYml.Db.Database).Find(&tables)
	return tables
}
