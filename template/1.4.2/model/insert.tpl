
func (m *default{{.upperStartCamelObject}}Model) Insert(ctx context.Context, tx *gorm.DB, data *{{.upperStartCamelObject}}) error {
	{{if .withCache}}
    err := m.ExecCtx(ctx, func(conn *gorm.DB) error {
		db := conn
        if tx != nil {
            db = tx
        }
        return db.Create(&data).Error
	}, m.getCacheKeys(data)...){{else}}db := m.conn
        if tx != nil {
            db = tx
        }
        err:= db.WithContext(ctx).Create(&data).Error{{end}}
	return err
}
