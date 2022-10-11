import 'dart:io';

import 'package:dio/dio.dart';

class AuthRepository {
  final Dio http = Dio();
  String token = '';
  String endpoint = 'http://192.168.152.13:8000/api/';

  Future <bool> login(String email, String password)async{
    var response = await http.post('${endpoint}login', options: Options(
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json'
      },
    ), data: {
      'email': email,
      'password': password
    });
    token = response.data['token'];
    return response.statusCode == 200;
  }

  Future <String> getToken()async{
    return token;
  }



}
