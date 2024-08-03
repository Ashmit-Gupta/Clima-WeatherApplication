import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  String task2Res = await task2();
  task3(task2Res);
}

void task1() {
  String str1 = "This is task 1";
  print(str1);
}

Future task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);
  String str2 = "null";
  //asynchronous , will not hault the execution of task 3 like sleep did !!
  await Future.delayed(threeSeconds, () {
    str2 = "This task 2 data";
    print("Completed Task 2!");
    print(str2);
  });
  return str2;
}

void task3(String task2Str) {
  String str3 = "This is task 3 + and this is from - $task2Str";
  print(str3);
}
