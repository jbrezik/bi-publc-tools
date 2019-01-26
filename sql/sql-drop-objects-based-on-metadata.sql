/*******************************************************************************
*                                                                              *
* File    : sql-drop-objects-based-on-metadata.sql                             *
* Purpose : SQL4SQL Statement to drop tables and views from listed databases.  *
* Usage   : Replace DatabaseName_to_drop in WHERE clause to list databases     *
*           you wish the get the drop statement generated. Copy the entire     *
*           column DML_Statement from Answerset and copy into new Query to     *
*           run the generated statement.                                       *
* Author  : Jakub BREZIK                                                       *
*                                                                              *
*******************************************************************************/

select
 DatabaseName,
 TableName,
 case 
  when TableKind = 'T' 
  then 'drop table ' || DatabaseName || '.' || TableName || ';'
  when TableKind = 'V'
  then 'drop view ' || DatabaseName || '.' || TableName || ';'
 end as DML_Statement
from dbc.Tables
where DatabaseName in (
 'DatabaseName_to_drop'
 )
 and TableKind in ('T','V')
;