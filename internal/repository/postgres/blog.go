package postgres

import "database/sql"

type BlogRepository struct {
	Conn *sql.DB
}
