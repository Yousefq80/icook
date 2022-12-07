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

      var token = response.data["access"];
      Client.dio.options.headers["Authorization"] = "Bearer $token";

      this.username = username;
      notifyListeners();
      var pref = await SharedPreferences.getInstance();
      await pref.setString("token", token);
      notifyListeners();
      return true;
    } on DioError catch (e) {
      // e = exception (error)
      print(e);
      // print(e.response!.statusCode);
      // print(e.response!.data);
    } catch (e) {
      print("unknown error");
      print('c: $e');
    }
    notifyListeners();
    return false;
  }

  Future<bool> hasToken() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");

    if (token != null && token.isNotEmpty && !JwtDecoder.isExpired(token)) {
      var tokenMap = JwtDecoder.decode(token);
      username = tokenMap['username'];
      notifyListeners();
      return true;
    }

    return false;
  }

  Future logout() async {
    username = null;
    var ref = await SharedPreferences.getInstance();
    ref.remove("token");
    Client.dio.options.headers["Authorization"] = null;
    notifyListeners();
  }

  // bool get isSignedIn {
  //   return username != null;
  // }

  Future<bool> login(
      {required String username, required String password}) async {
    String token;
    try {
      Response response = await Client.dio.post('/api/login/', data: {
        "username": username,
        "password": password,
      });
      token = response.data["access"];
      Client.dio.options.headers["Authorization"] = "Bearer $token";
      var ref = await SharedPreferences.getInstance();
      ref.setString("token", token);
      this.username = username;
      notifyListeners();
      return true;
    } on DioError catch (e) {
      print(e);
    }
    notifyListeners();
    return false;
  }
}
