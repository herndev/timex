import 'package:flutter/material.dart';
import 'registrationform.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class RegistrationPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
                title: Text('Create an Account'),
                backgroundColorStart: Colors.indigo,
                backgroundColorEnd: Colors.greenAccent,
              ),
          body:Stack(
            children:[
              SingleChildScrollView(
                child: Container(
                  child: RegistrationForm(),
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                )
              )

            ]
          )
        );
    
}
}