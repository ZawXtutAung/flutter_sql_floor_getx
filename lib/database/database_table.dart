import 'package:floor/floor.dart';

@Entity(tableName: 'mydb')
class MyDBTable {
  @PrimaryKey(autoGenerate: true)
  int? id;
  @ColumnInfo(name: 'name')
  String? name;
  String? job;
  MyDBTable(this.name, this.job, {this.id});
}
