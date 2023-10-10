import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mart/constant/constant.dart';
import 'package:shop_mart/constant/error_handling.dart';
import 'package:shop_mart/constant/utils.dart';
import 'package:shop_mart/features/auth/page/home_page.dart';
import 'package:shop_mart/features/auth/widget/bottom_bar.dart';
import 'package:shop_mart/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shop_mart/provider/user_provider.dart';

class AuthServices {
  void signUpUser(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.statusCode);
      httpErorrHandler(
        response: res,
        context: context,
        onSuccess: () {
          showSnackbar(context, 'User Created');
        },
      );
    } catch (e) {
      print(e);
      showSnackbar(context, e.toString());
    }
  }

  void signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.statusCode);
      log(res.body);
      httpErorrHandler(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackbar(context, 'User Logined');
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(BottomBar.routeName, (route) => false);
        },
      );
    } catch (e) {
      print(e);
      showSnackbar(context, e.toString());
    }
  }

  void getUser(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userResponse = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );
        var userProfider = Provider.of<UserProvider>(context, listen: false);
        userProfider.setUser(userResponse.body);
      }
    } catch (e) {
      print(e);
      showSnackbar(context, e.toString());
    }
  }
}
