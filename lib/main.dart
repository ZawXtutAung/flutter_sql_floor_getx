import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sql_floor/database/my_database.dart';
import 'package:flutter_sql_floor/screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: FutureBuilder<MyDatabase>(
            future: $FloorMyDatabase.databaseBuilder('mydb').build(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Get.put(snapshot.data!.dbdao);
                return MyHome();
              } else if (snapshot.hasError) {
                return Text('Error');
              } else
                return Text('Loding...');
            },
          )),
    );
  }
}
