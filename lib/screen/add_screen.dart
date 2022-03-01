import 'package:flutter/material.dart';
import 'package:flutter_sql_floor/database/database_dao.dart';
import 'package:flutter_sql_floor/database/database_table.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MyDatabaseDao myDao = Get.find();

    return Scaffold(
      appBar: AppBar(),
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
                  myDao.addDb(
                      MyDBTable(nameController.text, jobController.text));
                  Get.back();
                },
                child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
