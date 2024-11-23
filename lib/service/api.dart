import 'package:dio/dio.dart';

class Api{

Future <dynamic> get({required String Url})async{
  final response =await Dio().get(Url);
  if (response.statusCode==200){
 return response.data;
  }else {
   throw Exception('there was a problem : ${response.statusCode}'); 
  }
}

}