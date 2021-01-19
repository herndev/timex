class TaskResponse{

	final String message;//message
	final Map errors;//error
	final Map task;//task

	TaskResponse({this.message, this.errors, this.task});

	factory TaskResponse.fromJson(Map<String,dynamic> json){
		return TaskResponse(
			message: json['message'],
			errors: json['errors'],
			task: json['task']
		);
	}
}

class ModTaskResponse{

	final String message;//message

	ModTaskResponse({this.message});

	factory ModTaskResponse.fromJson(Map<String,dynamic> json){
		return ModTaskResponse(
			message: json['message'],
		);
	}
}


class UserTaskResponse{

	final List data;

	UserTaskResponse({this.data});

	factory UserTaskResponse.fromJson(json){
    try {
      return UserTaskResponse(
        data: json
      );
    } catch (e) {
      print(json['message']);
      return UserTaskResponse(
        data: json
      );
    }
	}
}