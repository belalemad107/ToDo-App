class Task {
  int? id;
  String? title;
  String? note;
  String? date;
  String? startTime;
  String? endTime;
  int? isCompleted;
  int? color;
  int? remind;
  String? repeat;
  Task({
    this.id,
    this.title,
    this.note,
    this.date,
    this.startTime,
    this.endTime,
    this.isCompleted,
    this.color,
    this.remind,
    this.repeat,
  });
  Task.fromJson(Map<String, dynamic> json) {
    id = json["id"];

    title = json["title"];

    note = json["note"];

    date = json["date"];

    startTime = json["startTime"];

    endTime = json["endTime"];
    isCompleted = json["isCompleted"];
    color = json["color"];
    remind = json["remind"];
    repeat = json["repeat"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["note"] = this.note;
    data["date"] = this.date;
    data["startTime"] = this.startTime;
    data["endTime"] = this.endTime;
    data["isCompleted"] = this.isCompleted;
    data["color"] = this.color;
    data["remind"] = this.remind;
    data["repeat"] = this.repeat;
    return data;
  }
}
