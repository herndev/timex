import 'package:flutter/material.dart';


class LoginForm extends StatefulWidget{
	@override
	LoginFormState createState() => LoginFormState();

}

InputDecoration txtDecoration(var str){

	return  InputDecoration(
		fillColor: Colors.white,
		filled: true,
		hintText: str,
		border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
		contentPadding: EdgeInsets.fromLTRB(15,15,10,8),
		
	);
}



class LoginFormState extends State<LoginForm>{
	final _formKey  = GlobalKey<FormState>();
	final emailExp = new RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
	final passTxtController  = TextEditingController();

	@override
	  void dispose() {
	    passTxtController.dispose();
	    super.dispose();
	  }

	_login(){

		if (_formKey.currentState.validate()) {
			//No auth			      
			Navigator.pushNamedAndRemoveUntil(context, '/',(Route<dynamic> route) => false);
		}

	}
	@override
	Widget build(BuildContext context){
		return Form(
			key: _formKey,
			child: Column(
				children: [
					SizedBox(
						height: 320
					),
					TextFormField(
						decoration : txtDecoration('Username'),
						validator: (value){
							if (value.isEmpty) {
						      return 'Enter your username';
						    }
						    return null;
						}
					),
					SizedBox(
						height: 25
					),
					TextFormField(
						obscureText: true,
						decoration : txtDecoration('Password'),
						controller: passTxtController,
						validator: (value){
							
							if (value.isEmpty) {
						      return 'Enter your password';
						    }
						   
						    return null;
						}
					),
					SizedBox(
						height: 30
					),
					
          ElevatedButton (    
						child: Text('Login'),
						onPressed: (){
            },  
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)
            ),
          ),
					SizedBox(
						height: 50
					),
					Text('Don\'t have an account?',
						style: TextStyle(
							color: Colors.white
						)
					),
					ElevatedButton(
						child: Text('Sign Up'),
						onPressed: (){
							Navigator.pushNamed(context, '/registration');
						},
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)
            ),
					),

				]

			)//Column

		);//Form
	}
}