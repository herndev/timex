class LoginResponse{

	final String token;//access_token
	final String errMsg;//error

	LoginResponse({this.token,this.errMsg});

	factory LoginResponse.fromJson(Map<String,dynamic> json){
		return LoginResponse(
			token: json['access_token'],
			errMsg: json['error']
		);
	}

}