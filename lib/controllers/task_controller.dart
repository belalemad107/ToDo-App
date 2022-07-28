import 'package:get/get.dart';
import 'package:to_do/db/db_helper.dart';
import 'package:to_do/models/task.dart';

class TaskController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DBHelper.delete(task);
    getTasks();
  }

  void markTaskCompleted(int id) async {
    await DBHelper.Update(id);
    getTasks();
  }
}
