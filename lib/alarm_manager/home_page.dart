import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';


class AlarmManagerPage extends StatefulWidget {
  const AlarmManagerPage({Key? key}) : super(key: key);

  @override
  _AlarmManagerPageState createState() => _AlarmManagerPageState();
}

class _AlarmManagerPageState extends State<AlarmManagerPage> {
  bool isOn_oneShot = false;
  bool isOn_oneShotAt = false;
  bool isOn_periodic = false;

  int alarmIdOneShot = 1;
  int alarmIdOneShotAt = 2;
  int alarmIdPeriodic = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Carousel slider"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("oneShot",style: TextStyle(color: Colors.white , fontSize: 20),),
            Transform.scale(
              scale: 2,
              child: Switch(
                  value: isOn_oneShot,
                  onChanged: (value) {
                    setState(() {
                      isOn_oneShot = value;
                    });

                    if(isOn_oneShot == true){
                      AndroidAlarmManager.oneShot(Duration(seconds: 5), alarmIdOneShot, fireAlarm);
                    }else{
                      AndroidAlarmManager.cancel(alarmIdOneShot);
                    }


                  }),
            ),
            SizedBox(height: 50,),

            Text("oneShot at",style: TextStyle(color: Colors.white , fontSize: 20),),
            Transform.scale(
              scale: 2,
              child: Switch(
                  value: isOn_oneShotAt,
                  onChanged: (value) {
                    setState(() {
                      isOn_oneShotAt = value;
                    });

                    if(isOn_oneShotAt == true){
                      AndroidAlarmManager.oneShotAt(DateTime(2022,10,15,15,09), alarmIdOneShotAt, fireAlarm);
                    }else{
                      AndroidAlarmManager.cancel(alarmIdOneShotAt);
                    }

                  }),
            ),


            SizedBox(height: 50,),

            Text("periodic" ,style: TextStyle(color: Colors.white , fontSize: 20),),
            Transform.scale(
              scale: 2,
              child: Switch(
                  value: isOn_periodic,
                  onChanged: (value) {
                    setState(() {
                      isOn_periodic = value;
                    });

                    if(isOn_periodic == true){
                      AndroidAlarmManager.periodic(Duration(seconds: 60), alarmIdPeriodic, fireAlarm);
                    }else{
                      AndroidAlarmManager.cancel(alarmIdPeriodic);
                    }

                  }),
            ),

          ],
        ),
      ),
    );
  }
}

void fireAlarm(){
  log('alarm manager onShot ====> : ${DateTime.now()}');
  Fluttertoast.showToast(
      msg: "alarm manager onShot ====> : ${DateTime.now()}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


