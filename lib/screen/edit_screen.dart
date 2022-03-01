import 'package:flutter/material.dart';
import 'package:flutter_sql_floor/database/database_dao.dart';
import 'package:flutter_sql_floor/database/database_table.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyDatabaseDao myDatabaseDao = Get.find();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController jobController = TextEditingController();
    MyDBTable myDBTable = Get.arguments;
    nameController.text = myDBTable.name!;
    jobController.text = myDBTable.job!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Name'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Job'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  myDatabaseDao.updateData(MyDBTable(
                      nameController.text, jobController.text,
                      id: myDBTable.id));
                  Get.back();
                },
                child: Text('Edit'))
          ],
        ),
      ),
    );
  }
}
