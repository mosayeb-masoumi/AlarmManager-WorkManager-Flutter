
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerPage extends StatefulWidget {
  const WorkManagerPage({Key? key}) : super(key: key);

  @override
  State<WorkManagerPage> createState() => _WorkManagerPageState();
}

class _WorkManagerPageState extends State<WorkManagerPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Workmanager().registerPeriodicTask(
        "PeriodicUniqueNameTaskTwo",
        "backUp" ,
        frequency: Duration(minutes: 15),
        // tag: "periodicTag" // one way to cancel periodic task


        // initialDelay: Duration(minutes: 5),
      // constraints: Constraints(networkType: NetworkType.connected , requiresCharging: true,requiresBatteryNotLow: false)
    ); // atleast 15 minutes. android dosent allow periodic below 15 minutes
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("work manager"), centerTitle: true),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              ElevatedButton(onPressed: (){
               Workmanager().registerOneOffTask(
                 "taskOneUniqueName",
                 "backUp" ,
                 // constraints: Constraints(networkType: NetworkType.connected , )
                 initialDelay: const Duration(seconds: 10) ,// after 5seconds we can see callbackDispatcher()  im main page will be call
               );

               },child: Text("run task1 afetr 10 seconds")),



              ElevatedButton(onPressed: (){
                Workmanager().cancelByUniqueName("taskOneUniqueName");
                // Workmanager().cancelAll(); // to cancel all tasks
                // Workmanager().cancelByTag("periodicTag");

              },child: Text("cancel task1")),




              SizedBox(height: 55,),


              ElevatedButton(onPressed: (){
                Workmanager().cancelByUniqueName("PeriodicUniqueNameTaskTwo");
                // Workmanager().cancelAll(); // to cancel all tasks
                // Workmanager().cancelByTag("periodicTag");

              },child: Text("cancel periodic workmanager")),








            ],
          ),
        ),
      ),
    );
  }
}
