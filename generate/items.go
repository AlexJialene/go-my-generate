package generate

type Label struct {
	Name       string
	Id         uint64
	DeleteFlag uint32
}

type Column struct {
	ColumnName    string
	ColumnComment string
	DataType      string
}
