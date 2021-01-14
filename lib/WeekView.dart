import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'Task.dart';
import 'Occurrence.dart';
import 'User.dart';
import 'MyHomepage.dart';
import 'package:provider/provider.dart';
import 'models/authmodel.dart';
import 'loginpage.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class WeekView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  if(!Provider.of<AuthModel>(context,listen:false).isLoggedIn){
        return LoginPage();
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWeekView(title: 'Timex'),
    );
  }
}

// it always has to add up to 24 hrs
// if I work 3 hrs then 21 hrs are free
// and if I study another 2hrs then 19hrs are free and so on

class MyWeekView extends StatefulWidget {
  MyWeekView({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyWeekViewState createState() => _MyWeekViewState();
}

class _MyWeekViewState extends State<MyWeekView> {
  List<List<TaskData>> listOfAllDays = [];

  void createAllTaskData() {
    User myUser = MyHomePage.theUser;

    for (int i = 0; i < 7; i++) {
      List<TaskData> listOfDayTasks = [];
      Map<String, int> listTasks = new Map();
      Map<String, int> listEndTimes = new Map();
      List<int> startTimes = [];
      List<int> endTimes = [];
      for (Task task in myUser.tasks) {
        for (Occurrence occurs in task.occurrence) {
          if (occurs.daysPerWeek.contains(i)) {
            int time = occurs.time[1].hour - occurs.time[0].hour;
            //listOfDayTasks.add(new TaskData(task.name, time));
            listTasks[task.name] = occurs.time[0].hour;
            listEndTimes[task.name] = occurs.time[1].hour;
            startTimes.add(occurs.time[0].hour);
            endTimes.add(occurs.time[1].hour);
          }
        }
      }
      int count = 0;
      for (TaskData data in listOfDayTasks) {
        count += data.time;
      }
      int counter = 0;
      int start = 0;
      int end = 0;
      String name = "";

      for (int i = 0; i < 24; i++) {
        if (startTimes.contains(i)) {
          for (Task task in myUser.tasks) {
            for (Occurrence occurs in task.occurrence) {
              if (occurs.time[0].hour == i) {
                name = task.name;
              }
            }
          }
          if (i != end) {
            if (end < i) {
              listOfDayTasks.add(new TaskData('free time', i - end));
            }
          }
          end = listEndTimes[name];
          start = i;
          listOfDayTasks.add(new TaskData(name, end - start));
        }
        if (i == 23) {
          if (i != end) {
            listOfDayTasks.add(new TaskData('free time', i - end));
          }
        }
      }
      // List<TaskData> orderedDayTasks = [];
      // for (int i = 0; i < 24; i++) {

      // }
      listOfAllDays.add(listOfDayTasks);
    }

    setState() {
      build(context);
    }
  }

  List<List<charts.Series<TaskData, int>>> listOfAllData = [];

  void data() {
    for (int i = 0; i < 7; i++) {
      listOfAllData.add(mondayData(i));
    }
  }

  List<charts.Series<TaskData, int>> mondayData(int day) {
    createAllTaskData();
    final data = listOfAllDays[day];

    return [
      new charts.Series<TaskData, int>(
        id: 'Sales',
        domainFn: (TaskData sales, _) => sales.time,
        measureFn: (TaskData sales, _) => sales.time,
        data: data,
      )
    ];
  }

// child: DonutPieChart(mondayData()),
  @override
  Widget build(BuildContext context) {
    data();
    return Scaffold(
       body: Stack(
        children: [
          Container(
            child: Image.asset('assets/images/logo1.png'),
            height: 300,
            width: 500,
          ),
          GridView.count(
            primary: false,
            padding: const EdgeInsets.fromLTRB(20, 280, 20, 80),
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              Container(
                child:ElevatedButton (    
                  child: Text('MONDAY'),
                  onPressed: (){
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DayView(listOfAllData[0], 0))
                    );
                  },  
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)
                  ),
                ),
              ),
              Container(
                child:ElevatedButton (    
                  child: Text('TUESDAY'),
                  onPressed: (){
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DayView(listOfAllData[1], 1)),
                          );
                  },  
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)
                  ),
                ),
              ),
              Container(
                child:ElevatedButton (    
                  child: Text('WEDNESDAY'),
                  onPressed: (){
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DayView(listOfAllData[2], 2)),
                          );
                  },  
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)
                  ),
                ),
              ),
              Container(
                child:ElevatedButton (    
                  child: Text('THURSDAY'),
                  onPressed: (){
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DayView(listOfAllData[3], 3)),
                          );
                  },  
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)
                  ),
                ),
              ),
              Container(
                child:ElevatedButton (    
                  child: Text('FRIDAY'),
                  onPressed: (){
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DayView(listOfAllData[4], 4)),
                          );
                  },  
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)
                  ),
                ),
              ),
              Container(
                child:ElevatedButton (    
                  child: Text('SATURDAY'),
                  onPressed: (){
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DayView(listOfAllData[5], 5)),
                          );
                  },  
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                child:ElevatedButton (     
                  child: Text('SUNDAY'),
                 
                  onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DayView(listOfAllData[6], 6)),
                          ).then((value) {
                            setState(() {
                              createAllTaskData();
                              build(context);
                              print("HELLO" + value);
                            });
                          });
                        },
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)
                  

                  ),
                ),
              ),
              
              
             

        ],
      ),
     
       Container(
        padding: EdgeInsets.fromLTRB(167, 700, 50, 50),
                child:FloatingActionButton (   
                   child:Icon(Icons.add,size: 50,), 
                   onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Create Task')),
          );
          setState() {
            build(context);
          }
        },
                )
       )
                 
                  
        ]
    )
    );
  }
}

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 500));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TaskData, int>> _createSampleData() {
    final data = [
      new TaskData("Work", 200),
      new TaskData("Exercise", 75),
      new TaskData("Study", 25),
      new TaskData("Chill", 5),
    ];

    return [
      new charts.Series<TaskData, int>(
        id: 'Sales',
        domainFn: (TaskData sales, _) => sales.time,
        measureFn: (TaskData sales, _) => sales.time,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class TaskData {
  final String name;
  final int time;

  TaskData(this.name, this.time);
}

class DayView extends StatefulWidget {
  List<charts.Series<TaskData, int>> listOfTasks;
  int day;
  DayView(List<charts.Series<TaskData, int>> list, int day) {
    this.listOfTasks = list;
    this.day = day;
  }
  @override
  _DayViewState createState() => _DayViewState(listOfTasks, day);
}

class _DayViewState extends State<DayView> {
  List<charts.Series<TaskData, int>> listOfTasks;
  Map<int, String> days = new Map();
  int day;

  _DayViewState(List<charts.Series<TaskData, int>> list, int day) {
    this.listOfTasks = list;
    this.day = day;
  }

  setIt() {
    setState() {
      build(context);
    }
  }

  BuildContext theContext;
  @override
  Widget build(BuildContext context) {
    theContext = context;
    days[0] = 'Monday';
    days[1] = 'Tuesday';
    days[2] = 'Wednesday';
    days[3] = 'Thursday';
    days[4] = 'Friday';
    days[5] = 'Saturday';
    days[6] = 'Sunday';

    return Scaffold(
        appBar: GradientAppBar(
                 title: Text (days[day]),
                backgroundColorStart: Colors.indigo,
                backgroundColorEnd: Colors.greenAccent,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: DonutPieChart(listOfTasks),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 260),
              child: ListView(
                children: makeTaskList(),
              ),
            )
          ],
        )));
  }

  TextStyle labelStyle = new TextStyle(
      fontFamily: 'Avenir', fontSize: 20, fontWeight: FontWeight.bold);

  List<Widget> makeTaskList() {
    List<String> taskNames = [];
    Map<String, int> hoursList = new Map();
    Map<String, DateTime> timeOfDay = new Map();
    for (Task task in MyHomePage.theUser.tasks) {
      for (Occurrence occurs in task.occurrence) {
        if (occurs.daysPerWeek.contains(day)) {
          if (!taskNames.contains(task.name)) {
            taskNames.add(task.name);
            int time = occurs.time[1].hour - occurs.time[0].hour;
            hoursList[task.name] = time;
            timeOfDay[task.name] = occurs.time[0];
          }
        }
      }
    }
    List<Widget> rows = [];
    for (int i = 0; i < taskNames.length; i++) {
      Container newContainer = new Container(
          height: 100,
          width: 300,
          child: GestureDetector(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        taskNames[i],
                        style: labelStyle,
                      ),
                      Text(
                        makeTheTimeString(
                            timeOfDay[taskNames[i]], hoursList[taskNames[i]]),
                        style: labelStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Total Time: ",
                        style: labelStyle,
                      ),
                      Text(
                        hoursList[taskNames[i]].toString() + "hrs",
                        style: labelStyle,
                      ),
                    ],
                  )
                ],
              ),
              elevation: 5,
            ),
            onTap: () {
              print("Pressed");
              _showDialog(taskNames[i], hoursList[taskNames[i]],
                  timeOfDay[taskNames[i]]);
            },
          ));
      rows.add(newContainer);
    }
    return rows;
  }

  void _showDialog(String taskName, int duration, DateTime startTimeOfDay) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(taskName),
          content:
              new Text('Time: ' + makeTheTimeString(startTimeOfDay, duration)),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
                key: new Key('one'),
                child: new Text("Delete"),
                onPressed: () {
                  deleteATask(taskName);
                  Navigator.of(context).pop();
                  Navigator.of(theContext).pop();
                }),
          ],
        );
      },
    );
  }

  void deleteATask(String taskName) {
    List<Task> taskList = MyHomePage.theUser.tasks;
    for (Task task in taskList) {
      if (task.name == taskName) {
        task.removeOccurrenceByDay(day);
      }
    }
    MyHomePage.theUser.tasks = taskList;
  }

  String makeTheTimeString(DateTime date, int duration) {
    if (date.minute > 10) {
      return date.hour.toString() +
          ":" +
          date.minute.toString() +
          "-" +
          (date.hour + duration).toString() +
          ":" +
          date.minute.toString();
    } else {
      return date.hour.toString() +
          ":0" +
          date.minute.toString() +
          "-" +
          (date.hour + duration).toString() +
          ":0" +
          date.minute.toString();
    }
  }
}
