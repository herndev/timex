import 'package:flutter/material.dart';


class RegistrationForm extends StatefulWidget{
	@override
	RegistrationFormState createState() => RegistrationFormState();

}

InputDecoration txtDecoration(var str){

	return  InputDecoration(
		fillColor: Colors.white,
		filled: true,
		hintText: str,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    contentPadding: EdgeInsets.fromLTRB(15, 15, 10, 10)
	);
}



class RegistrationFormState extends State<RegistrationForm>{
  final _bottomSpace = 10.0;
	final _formKey  = GlobalKey<FormState>();
	bool _isAccepted  = false;
	final emailExp = new RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)");
	final passTxtController  = TextEditingController();

	@override
	  void dispose() {
	    passTxtController.dispose();
	    super.dispose();
	  }
    _register(){
      if (_formKey.currentState.validate()) {
        Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text('Saving...')));
          }

    }

	@override
	Widget build(BuildContext context){
		return Form(
			key: _formKey,
			child: Column(
				children: [
          SizedBox(
            height: 30,
          ),
					TextFormField(
						decoration:txtDecoration('First Name'),
						validator: (value){
							if (value.isEmpty) {
						      return 'Enter First Name';
						    }
						    return null;
						}
					),

          SizedBox(
            height: _bottomSpace
          ),

					TextFormField(
						decoration: txtDecoration('Last Name'),
						validator: (value){
							if (value.isEmpty) {
						      return 'Enter Last Name';
						    }
						    return null;
						}
					),
           SizedBox(
            height: _bottomSpace
          ),
					TextFormField(
						decoration : txtDecoration('Username'),
						validator: (value){
							if (value.isEmpty) {
						      return 'Enter Username';
						    }
						    return null;
						}
					),
           SizedBox(
            height: _bottomSpace
          ),
					TextFormField(
						decoration : txtDecoration('Email'),
						validator: (value){
							if (value.isEmpty)
						      return 'Enter an Email';
						   	else if(emailExp.hasMatch(value) == false)
						   		return 'Invalid Email';

						    return null;
						}
					),
           SizedBox(
            height: _bottomSpace
          ),
					TextFormField(
						obscureText: true,
						decoration : txtDecoration('Password'),
						controller: passTxtController,
						validator: (value){
							
							if (value.isEmpty) {
						      return 'Enter Password';
						    }
						    else if(value.length < 8)
						    	return 'Password must be at least 8 characters';
						    return null;
						}
					),
           SizedBox(
            height: _bottomSpace
          ),
					TextFormField(
						obscureText: true,
						decoration : txtDecoration('Confirm Password'),
						validator: (value){
						
							if (value.isEmpty) 
						     	return 'Confirm your password';
						    else if(value != passTxtController.text)
						    	return 'Password unmatch';
						    	
						    return null;
						}
					),
           SizedBox(
            height: 25
          ),
					Row(
						children: [
							Checkbox(
								value: _isAccepted,
								onChanged: (isAccepted){
									setState((){
										_isAccepted   = isAccepted;
									});
								}

							),
							Text('By clicking Sign Up, you agree to our Terms\nof Service and that you have read our \nPrivacy Policy.')

						]
					),
          SizedBox(
            height: 30
          ),
					ElevatedButton(
						child: Text('Sign Up'),
						onPressed: _isAccepted?_register:null
					)

				]

			)//Column

		);//Form
	}
}