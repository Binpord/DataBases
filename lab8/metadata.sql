USE CELLULAR;

-- Names of tables, created by the user
SELECT sys.objects.name
	FROM sys.objects JOIN sys.schemas SC ON sys.objects.schema_id = SC.schema_id
	WHERE sys.objects.type = 'U'			-- User-defined tables
		-- Fixing NULL principal_id-s for objects, created by the schema owner
		AND ISNULL(sys.objects.principal_id, SC.principal_id) = USER_ID()
		AND sys.objects.object_id NOT IN (SELECT major_id FROM sys.extended_properties);

-- Table name, column name, nullable, type name, type length for each table 
-- for each column, created by the user
SELECT sys.objects.name AS Table_name, sys.columns.name AS Column_name, sys.columns.is_nullable, 
	sys.types.name, sys.types.max_length
	FROM sys.objects JOIN sys.schemas SC ON sys.objects.schema_id = SC.schema_id
		JOIN sys.columns ON sys.objects.object_id = sys.columns.object_id
		JOIN sys.types ON sys.columns.user_type_id = sys.types.user_type_id
	WHERE sys.objects.type = 'U'
		AND ISNULL(sys.objects.principal_id, SC.principal_id) = USER_ID()
		AND objects.object_id NOT IN (SELECT major_id FROM sys.extended_properties);

-- Name of constraint, table name, constraint type for each reference, created by the user
SELECT [Reference].name AS Const_name, Parent.name AS Table_name, [Reference].type
	FROM sys.objects [Reference] JOIN sys.objects Parent ON [Reference].parent_object_id = Parent.object_id
		JOIN sys.schemas SC ON SC.schema_id = [Reference].schema_id
	WHERE ISNULL([Reference].principal_id, SC.principal_id) = USER_ID()
		AND [Reference].type IN ('F', 'PK')
		AND Parent.object_id NOT IN (SELECT major_id FROM sys.extended_properties)

-- Name of foreign key, table contains, parent table for each foreign key, created by the user
SELECT FK.name AS For_key_name, Child.name AS Child_table, Parent.name AS Parent_table
	FROM sys.foreign_keys FK JOIN sys.objects Parent ON FK.parent_object_id = Parent.object_id
		JOIN sys.objects Child ON FK.referenced_object_id = Child.object_id
		JOIN sys.schemas SC ON FK.schema_id = SC.schema_id
	WHERE ISNULL(FK.principal_id, SC.principal_id) = USER_ID();

-- View name and script for each view, created by the user
SELECT VW.name, sys.sql_modules.definition
	FROM sys.objects VW INNER JOIN sys.sql_modules ON VW.object_id = sys.sql_modules.object_id
		JOIN sys.schemas SC ON VW.schema_id = SC.schema_id
	WHERE ISNULL(VW.principal_id, SC.principal_id) = USER_ID()
		AND VW.type = 'V';

-- Trigger name and table name for each trigger (db doesn't have one) created by the user
SELECT TR.name, Tbl.name
	FROM sys.objects TR JOIN sys.objects Tbl ON TR.parent_object_id = Tbl.object_id
		JOIN sys.schemas SC ON TR.schema_id = SC.schema_id
	WHERE ISNULL(TR.principal_id, SC.principal_id) = USER_ID()
		AND TR.type = 'TR';