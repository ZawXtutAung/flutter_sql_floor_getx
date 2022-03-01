import 'package:flutter/material.dart';
import 'package:flutter_sql_floor/database/database_dao.dart';
import 'package:flutter_sql_floor/database/database_table.dart';
import 'package:flutter_sql_floor/database/my_database.dart';
import 'package:flutter_sql_floor/screen/add_screen.dart';
import 'package:flutter_sql_floor/screen/edit_screen.dart';
import 'package:get/get.dart';

class MyHome extends StatelessWidget {
  MyHome();
  final MyDatabaseDao dbdao = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: EdgeInsets.all(10), child: dataItem()),
      floatingActionButton: Row(mainAxisSize: MainAxisSize.min, children: [
        FloatingActionButton(
          heroTag: 'add',
          onPressed: () {
            Get.to(AddScreen());
            //Get.put(AddScreen());
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          width: 5,
        ),
        FloatingActionButton(
          heroTag: 'del',
          onPressed: () {},
          child: Icon(Icons.delete),
        )
      ]),
    );
  }

  Widget dataItem() {
    return StreamBuilder<List<MyDBTable>>(
        stream: dbdao.getAlldb(),
        builder: (_, data) {
          if (data.hasData) {
            return ListView.builder(
              itemCount: data.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: Container(
                      // height: 80,
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      data.data![index].name!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(data.data![index].job!)
                                  ]),
                            ),
                          ),
                          Container(
                            //color: Colors.blueGrey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      dbdao.delData(data.data![index]);
                                    },
                                    icon: Icon(Icons.delete)),
                                IconButton(
                                    onPressed: () {
                                      Get.to(EditScreen(),
                                          arguments: data.data![index]);
                                      // dbdao.delData(data.data![index]);
                                    },
                                    icon: Icon(Icons.edit))
                              ],
                            ),
                          )
                        ],
                      )),
                );
              },
            );
          } else if (data.hasError) {
            return Card(
                child: Column(
              children: [
                Text('data'),
              ],
            ));
          } else
            return Text('Loding...');
        });
  }
}
