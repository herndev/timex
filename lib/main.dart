import 'package:flutter/material.dart';
import 'MyHomepage.dart';
import 'models/authmodel.dart';
import 'WeekView.dart';
import 'loginpage.dart';
import 'registrationpage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes:{
          '/' :(context) => WeekView(),
          '/login' : (context) => LoginPage(),
          '/registration': (context) => RegistrationPage(),
        },
      )
    );
  }
}
