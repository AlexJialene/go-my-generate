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
	Author  string
	Entity  string
	Package string
	Db      struct {
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
	Date                string
	Author              string
	EntityName          string
	LowercaseEntityName string
	TableName           string
	PackageName         string
	Fields              []Field
	Columns             []Columns
}

type Field struct {
	Name       string
	TypeName   string
	Comment    string
	ColumnName string
}

type Columns struct {
	Name     string
	TypeName string
	Comment  string
}
