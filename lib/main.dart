import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_flutter/alarm_manager/home_page.dart';
import 'package:test_flutter/work_manager/work_manager.dart';
import 'package:workmanager/workmanager.dart';



void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    print("Native called background task: $taskName"); //simpleTask will be emitted here.
    Fluttertoast.showToast(
        msg: "alarm manager onShot ====> : ${DateTime.now()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );


    return Future.value(true);
  });
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();

  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: AlarmManagerPage(),
      home: WorkManagerPage(),
    );
  }
}

