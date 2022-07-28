import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do/controllers/task_controller.dart';
import 'package:to_do/features/add_task/presentation/pages/add_task_page.dart';
import 'package:to_do/core/theme.dart';
import 'package:to_do/features/add_task/presentation/widgets/button.dart';
import 'package:to_do/features/add_task/presentation/widgets/task_tile.dart';
import 'package:to_do/models/task.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            _addTaskBar(),
            _addDateBar(),
            SizedBox(height: 10),
            _showTasks(),
          ],
        ));
  }

  _showTasks() {
    return Expanded(child: Obx(() {
      return ListView.builder(
          itemCount: _taskController.taskList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Task task = _taskController.taskList[index];
            print(task.toJson());
            // return GestureDetector(
            //   onTap: () {
            //     _taskController.delete(_taskController.taskList[index]);
            //     _taskController.getTasks();
            //   },
            //   child:
            // return Container(
            //   width: 100,
            //   height: 50,
            //   color: Colors.green,
            //   margin: const EdgeInsets.only(bottom: 10),
            //   child: Text(_taskController.taskList[index].title.toString()),
            if (task.repeat == 'Daily') {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                    child: Row(children: [
                      GestureDetector(
                        onTap: () {
                          print('tapped');
                          _showBottomSheet(context, task);
                          // _taskController.getTasks();
                        },
                        child: TaskTile(task),
                      )
                    ]),
                  ))

                  //   ),
                  // );
                  // },
                  );
            }
            if (task.date == DateFormat.yMd().format(_selectedDate)) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                    child: Row(children: [
                      GestureDetector(
                        onTap: () {
                          print('tapped');
                          _showBottomSheet(context, task);
                          // _taskController.getTasks();
                        },
                        child: TaskTile(task),
                      )
                    ]),
                  ))

                  //   ),
                  // );
                  // },
                  );
            } else {
              return Container();
            }
          });
    }));
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4),
      height: task.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      color: Get.isDarkMode ? darkGreyClr : white,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
            ),
          ),
          Spacer(),
          task.isCompleted == 1
              ? Container()
              : _bottomSheetButton(
                  label: "Task Completed",
                  onTab: () {
                    _taskController.markTaskCompleted(task.id!);
                    Get.back();
                  },
                  clr: primaryClr,
                  context: context,
                ),
          _bottomSheetButton(
            label: "Delete Task",
            onTab: () {
              setState(() {
                _taskController.delete(task);
                _taskController.getTasks();
                Get.back();
              });
            },
            clr: Colors.red[300]!,
            context: context,
          ),
          const SizedBox(
            height: 20,
          ),
          _bottomSheetButton(
            label: "Close",
            onTab: () {
              Get.back();
            },
            clr: Colors.red[300]!,
            isClose: true,
            context: context,
          ),
          const SizedBox(height: 10),
        ],
      ),
    ));
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTab,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
          child: Center(
              child: Text(
            label,
            style:
                isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          )),
          margin: EdgeInsets.symmetric(vertical: 4),
          height: 55,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: isClose ? Colors.transparent : clr,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2,
              color: isClose ? Colors.grey[300]! : clr,
            ),
          )),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        width: 80,
        height: 100,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
            debugPrint('date: $date');
          });
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMEd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  'Today',
                  style: headingStyle,
                ),
              ],
            ),
          ),
          MyButton(
              label: '+ Add Task',
              onTab: () async {
                await Get.to(const AddTaskPage());
                _taskController.getTasks();
              }),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      // backgroundColor: context.theme.backgroundColor,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          // ThemeServices().swichTheme();
          // debugPrint('Theme changed');
          Get.back();
        },
        // child: Icon(
        //   color: Get.isDarkMode ? Colors.white : Colors.black,
        //   Get.isDarkMode ? Icons.wb_sunny_rounded : Icons.nightlight_rounded,
        //   size: 20,
        child: Icon(Icons.arrow_back, color: Colors.black),
      ),
      actions: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/user-1.jpg'),
        ),
        SizedBox(width: 20),
      ],
    );
    // ignore: prefer_const_literals_to_create_immutables
  }
}
