import 'package:flutter/material.dart';
import 'loginform.dart';

class LoginPage extends StatelessWidget{

	@override
	Widget build(BuildContext context){
		return Scaffold(
		
      body: Stack(
				children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.indigo, Colors.greenAccent])),
          ),
          Container(
            child: Image.asset('assets/images/logo1.png'),
            height: 400,
            width: 500,
          ),
					SingleChildScrollView(
						child: Container(
							child: LoginForm(),
							padding: EdgeInsets.all(50)
						)//Container
					)//SingleChildScrollView

				]
			)

		);

	}

}