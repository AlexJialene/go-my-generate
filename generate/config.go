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
}{}
