package generate

type Config struct {
	Table     string
	Entity    string
	MainClass string
	Database  string
	Url       string
	User      string
	Password  string
}

var Config1 = struct {
	Entity string
	Db     struct {
		TableName string
	}
}{}

var ConfigYml = struct {
	Entity string
	Main   string
	Db     struct {
		Table    string
		Database string
		Host     string
		Port     int32
		User     string
		Password string
	}
	Templates []struct {
		Template string
	}
}{}

//Final assembly block
type Assembly struct {
	entityName          string
	lowercaseEntityName string
	tableName           string
	packageName         string
	fields              []Field
	columns             []Columns
}

type Field struct {
	name     string
	typeName string
	comment  string
}

type Columns struct {
	name     string
	typeName string
	comment  string
}
