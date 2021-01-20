import 'package:flutter/material.dart';
import 'package:timex/services/taskservice.dart';
import 'MyHomepage.dart';
import 'WeekView.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'models/authmodel.dart';
import 'loginpage.dart';

class SecondRoute extends StatefulWidget {
  String name;
  SecondRoute(String name) {
    this.name = name;
  }
  @override
  _SecondRouteState createState() => _SecondRouteState(name);
}

class _SecondRouteState extends State<SecondRoute> {
  String taskName;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;
  List days_of_week = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List<int> days = [];
  Future<TimeOfDay> timeFrom;
  Future<TimeOfDay> timeTo;
  bool repeats = false;
  _SecondRouteState(String name) {
    this.taskName = name;
  }
  TextStyle weedayStyle = TextStyle(
      fontFamily: 'Avenir', fontSize: 10, fontWeight: FontWeight.bold);
  TextStyle titles = TextStyle(
      fontFamily: 'Avenir', fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
                title: Text(taskName),
                backgroundColorStart: Colors.indigo,
                backgroundColorEnd: Colors.greenAccent,
              ),
             drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                        colors: [Colors.indigo, Colors.greenAccent]),
                      ),
                      child: Text(
                        'Account Menu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.close),
                      title: Text('Logout'),
                      onTap: () {
                      Provider.of<AuthModel>(context,listen:false).logout();	
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
							    	},
                    ),
                  ],
                ),
              ),

        body: Center(
            child: Container(
          margin: EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Repeats: ',
                style: titles,
              ),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Monday',
                              style: weedayStyle,
                            ),
                            Checkbox(
                              value: monday,
                              onChanged: (value) {
                                if (!this.days.contains(0)) {
                                  this.days.add(0);
                                } else {
                                  this.days.remove(0);
                                }
                                setState(() {
                                  monday = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Tuesday',
                              style: weedayStyle,
                            ),
                            Checkbox(
                              value: tuesday,
                              onChanged: (value) {
                                if (!this.days.contains(1)) {
                                  this.days.add(1);
                                } else {
                                  this.days.remove(1);
                                }
                                setState(() {
                                  tuesday = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Wednesday',
                              style: weedayStyle,
                            ),
                            Checkbox(
                              value: wednesday,
                              onChanged: (value) {
                                if (!this.days.contains(2)) {
                                  this.days.add(2);
                                } else {
                                  this.days.remove(2);
                                }
                                setState(() {
                                  wednesday = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Thursday',
                              style: weedayStyle,
                            ),
                            Checkbox(
                              value: thursday,
                              onChanged: (value) {
                                if (!this.days.contains(3)) {
                                  this.days.add(3);
                                } else {
                                  this.days.remove(3);
                                }
                                setState(() {
                                  thursday = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Friday',
                              style: weedayStyle,
                            ),
                            Checkbox(
                              value: friday,
                              onChanged: (value) {
                                if (!this.days.contains(4)) {
                                  this.days.add(4);
                                } else {
                                  this.days.remove(4);
                                }
                                setState(() {
                                  friday = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Saturday',
                              style: weedayStyle,
                            ),
                            Checkbox(
                              value: saturday,
                              onChanged: (value) {
                                if (!this.days.contains(5)) {
                                  this.days.add(5);
                                } else {
                                  this.days.remove(5);
                                }
                                setState(() {
                                  saturday = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Sunday',
                              style: weedayStyle,
                            ),
                            Checkbox(
                              value: sunday,
                              onChanged: (value) {
                                if (!this.days.contains(6)) {
                                  this.days.add(6);
                                } else {
                                  this.days.remove(6);
                                }
                                setState(() {
                                  sunday = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.greenAccent])),
                child: Builder(
                  builder: (context) => FlatButton(
                    onPressed: () {
                      timeFrom = showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    },
                    child: Text(
                      "Set Initial time",
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    
                  ),
                ),
              ),
              
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.greenAccent])),
                 child: Builder(
                  builder: (context) => FlatButton(
                    onPressed: () {
                      timeTo = showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    },
                    child: Text(
                      "Set End time",
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  if (this.days.length > 0 &&
                      this.timeFrom != null &&
                      this.timeTo != null) {
                    var token = Provider.of<AuthModel>(context,listen:false).token;
                    createTask(token);
                    // Navigator.pop(context);
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        )));
  }

  void createTask(token) async {
    for (int day in days) {
      print(day);
    }

    DateTime rightNow = new DateTime.now();
    DateTime timeStart;
    DateTime timeEnd;

    // print(this.repeats);

    await timeFrom.then((value) => timeStart = new DateTime(
        rightNow.year, rightNow.month, rightNow.day, value.hour, value.minute));
    print(timeStart.toString());
    await timeTo.then((value) => timeEnd = new DateTime(
        rightNow.year, rightNow.month, rightNow.day, value.hour, value.minute));
    print(timeEnd.toString());
    List<DateTime> times = [];
    times.add(timeStart);
    times.add(timeEnd);


    for (int day in days) {
      var data = {
        "task": this.taskName,
        "day": days_of_week[day],
        "initial_time": timeStart.toString(),
        "end_time": timeEnd.toString()
      };
      print(day);
      
      await newTask(token, data);
    }

    
    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    // MyHomePage.theUser
    //     .createTask(this.taskName, this.days, times, this.repeats);
    // Navigator.of(context).pop();
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => WeekView()),
    // );
  }
}
