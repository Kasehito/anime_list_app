import 'package:anime_list_app/data/database_helper.dart';
import 'package:anime_list_app/model/task_model.dart';
import 'package:get/get.dart';

class DbController extends GetxController {
  //variable untuk refresh data
  var taskList = <TaskModel>[].obs;

  final dbHelper = DatabaseHelper();

  @override
  void onInit() {
    loadTask();
    super.onInit();
  }

  void loadTask() async {
    List<TaskModel> task = await dbHelper.getTaskList();
    taskList.value = task;
  }

  void addTask(TaskModel taskModel) async {
    await dbHelper.insertTask(taskModel);
    loadTask();
  }
}
