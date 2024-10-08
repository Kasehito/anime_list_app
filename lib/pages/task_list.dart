import 'package:anime_list_app/model/task_model.dart';
import 'package:anime_list_app/controller/db_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTaskDatabase extends StatelessWidget {
  final DbController dbController = Get.put(DbController());

  MyTaskDatabase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaskList'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                TaskModel task = TaskModel(
                    title: "int title",
                    description: "int description",
                    imageUrl: "int imageUrl",
                    genre: "int genre",
                    rating: 0.0);
              },
              child: Text('Add Task'),
            ),
            Obx(() {
              return ListView.builder(
                itemCount: dbController.taskList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('TaskModel.title'),
                    subtitle: Text('TaskModel.description'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
