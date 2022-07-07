from peewee import *

database = MySQLDatabase('file_manager', **{'charset': 'utf8', 'sql_mode': 'PIPES_AS_CONCAT', 'use_unicode': True, 'host': 'localhost', 'port': 3306, 'user': 'root', 'password': '123456'})

class UnknownField(object):
    def __init__(self, *_, **__): pass

class BaseModel(Model):
    class Meta:
        database = database

class Bugs(BaseModel):
    bug_content = TextField(null=True)
    bug_id = AutoField()
    bug_summary = CharField(null=True)
    create_at = DateTimeField(constraints=[SQL("DEFAULT CURRENT_TIMESTAMP")], null=True)
    is_fixed = IntegerField(constraints=[SQL("DEFAULT 0")], null=True)

    class Meta:
        table_name = 'bugs'

class FileTags(BaseModel):
    file_id = IntegerField(null=True)
    is_deleted = IntegerField(constraints=[SQL("DEFAULT 0")], null=True)
    tag_id = AutoField()
    tag_name = CharField(null=True)

    class Meta:
        table_name = 'file_tags'

class Files(BaseModel):
    create_at = DateTimeField(constraints=[SQL("DEFAULT CURRENT_TIMESTAMP")], null=True)
    depth = IntegerField(null=True)
    father_path = CharField(null=True)
    file_id = AutoField()
    file_name = CharField(null=True)
    is_deleted = IntegerField(constraints=[SQL("DEFAULT 0")], null=True)
    saved_path = CharField(null=True)

    class Meta:
        table_name = 'files'

