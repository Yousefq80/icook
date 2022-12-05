import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../client.dart';

class AuthProvider extends ChangeNotifier {
  String? username;

  Future<bool> signup({
    required String username,
    required String password,
  }) async {
    try {
      var response = await Client.dio.post("/api/register/", data: {
        "username": username,
        "password": password,
      });

      var token = response.data["token"];
      Client.dio.options.headers["Authorization"] = "Bearer $token";

      username = username;

      var pref = await SharedPreferences.getInstance();
      await pref.setString("token", token);

      return true;
    } on DioError catch (e) {
      // e = exception (error)
      print(e.response!.statusCode);
      print(e.response!.data);
    } catch (e) {
      print("unknown error");
    }

    return false;
  }

  Future<bool> hasToken() async {
    var pref = await SharedPreferences.getInstance();
    var token = null; //pref.getString("token");

    if (token != null && token.isNotEmpty && !JwtDecoder.isExpired(token)) {
      var tokenMap = JwtDecoder.decode(token);
      username = tokenMap['username'];
      return true;
    }

    return false;
  }
}
