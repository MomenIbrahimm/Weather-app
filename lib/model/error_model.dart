class ErrorModel{
  String? code;
  String? message;

  ErrorModel({this.code, this.message});

  ErrorModel.fromJson(Map <String,dynamic> json){
    code = json['cod'];
    message = json['message'];
  }
}