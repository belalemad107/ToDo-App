import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/controllers/task_controller.dart';
import 'package:to_do/core/theme.dart';
import 'package:to_do/features/add_task/presentation/widgets/button.dart';
import 'package:to_do/features/add_task/presentation/widgets/input_field.dart';
import 'package:to_do/models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TaskController _taskController = Get.put(TaskController());
  int _selectedColor = 0;
  DateTime _selectedDate = DateTime.now();
  String _endTime = '9:20 PM';
  String _startTime = DateFormat("hh:mm a").format(DateTime.now());
  int _selectedRemind = 5;
  List<int> remind = [
    5,
    10,
    15,
    20,
    25,
    30,
  ];
  String _selectedRepeat = 'Never';
  List<String> repeat = ['Never', 'Daily', 'Weekly', 'Monthly'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.theme.backgroundColor,
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Task',
                  style: headingStyle,
                ),
                InputField(
                  controller: _titleController,
                  title: 'Title',
                  hint: 'enter your title',
                  hintStyle: subTitleStyle,
                ),
                InputField(
                  controller: _noteController,
                  title: 'Note',
                  hint: 'enter your note',
                  hintStyle: subTitleStyle,
                ),
                InputField(
                  title: 'Date',
                  hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                      icon: const Icon(Icons.calendar_today_outlined,
                          color: Colors.grey),
                      onPressed: () {
                        debugPrint('date widget works');
                        _getDateFromUser();
                      }),
                  hintStyle: formTitleStyle,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InputField(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                          onPressed: () {
                            debugPrint('start date widget works');
                            _getTimeFromUser(isStartTime: true);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.black,
                          )),
                      hintStyle: formTitleStyle,
                    )),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: InputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                          onPressed: () {
                            debugPrint('end date widget works');
                            _getTimeFromUser(isStartTime: false);
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: Colors.black,
                          )),
                      hintStyle: formTitleStyle,
                    )),
                  ],
                ),
                InputField(
                  title: 'Remind',
                  hint: "$_selectedRemind minutes early",
                  widget: DropdownButton(
                    underline: Container(
                      height: 0,
                    ),
                    items: remind.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black),
                    iconSize: 32,
                    elevation: 4,
                    style: formTitleStyle,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRemind = int.parse(newValue!);
                      });
                    },
                  ),
                  hintStyle: formTitleStyle,
                ),
                InputField(
                  title: 'Repeat',
                  hint: _selectedRepeat,
                  widget: DropdownButton(
                    underline: Container(
                      height: 0,
                    ),
                    items: repeat.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black),
                    iconSize: 32,
                    elevation: 4,
                    style: formTitleStyle,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRepeat = newValue!;
                      });
                    },
                  ),
                  hintStyle: formTitleStyle,
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _colorPallete(),
                      MyButton(
                          label: "Create Task",
                          onTab: () {
                            setState(() {
                              _validateData();
                            });
                          }),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 10,
          margin: const EdgeInsets.all(10),
          borderColor: Colors.red,
          borderWidth: 1);
    }
  }

  _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          children: List<Widget>.generate(
            3,
            (int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColor = index;
                    debugPrint('$index color selected');
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? primaryClr
                        : index == 1
                            ? pinkClr
                            : yelloClr,
                    child: _selectedColor == index
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 16,
                          )
                        : Container(),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
        task: Task(
      title: _titleController.text,
      note: _noteController.text,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      remind: _selectedRemind,
      repeat: _selectedRepeat,
      color: _selectedColor,
      isCompleted: 0,
    ));
    debugPrint('$value task added');
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatTime = pickedTime.format(context);
    if (pickedTime == null) {
      debugPrint('time is cancelled');
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0])),
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
        debugPrint('$_selectedDate');
      });
    } else {
      debugPrint('date is null');
    }
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      // backgroundColor: context.theme.backgroundColor,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/user-1.jpg'),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
