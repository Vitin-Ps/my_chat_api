ALTER TABLE tbl_mensagem
    ALTER COLUMN data TYPE TIMESTAMP USING data::TIMESTAMP,
    ALTER COLUMN data SET NOT NULL;
