import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/models/user.dart';
import '../../presentation/sign_in/models/sign_in_model.dart';
import '../../presentation/sign_up/models/sign_up_model.dart';
import '../utils/constants.dart';
import 'storage_service.dart';

class RemoteService {
  static var client = http.Client();

  static Future<SignIn?> loginUser(
      {required String userName, required String password}) async {
    var response = await client.post(Uri.parse('$baseURL/jwt-auth/v1/token'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"username": userName, "password": password}));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      final Map<String, dynamic> data = json.decode(jsonString);
      return SignIn.fromJson(data);
    } else {
      //show error message
      return null;
    }
  }

  static Future<SignUp?> registerUser(
      {required String userName,
      required String email,
      required String password}) async {
    var response = await client.post(Uri.parse('$baseURL/wp/v2/users/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "username": userName,
          "email": email,
          "password": password
        }));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      final Map<String, dynamic> data = json.decode(jsonString);
      return SignUp.fromJson(data);
    } else {
      //show error message
      return null;
    }
  }

  static Future<User?> userDetails() async {
    var response = await client.post(Uri.parse('$baseURL/wp/v2/users/me'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${getAuthToken()}',
        },
        body: jsonEncode(<String, String>{}));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      setUserResponse(jsonString);
      return userFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future<User?> updateUser(int id, Map<String, String> data) async {
    var response = await client.post(Uri.parse('$baseURL/wp/v2/users/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${getAuthToken()}',
        },
        body: jsonEncode(data));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      setUserResponse(jsonString);
      return userFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
