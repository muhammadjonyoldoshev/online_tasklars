import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

final userNameController = TextEditingController();
final passwordController = TextEditingController();

class User {
  String? userName;
  String? password;

  User({this.userName, this.password});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson () => {
    'userName': userName,
    'password': password,
  };

  // method
  void _doLogin() async {
    String userName = userNameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user1 = User(userName: userName, password: password);
    var box = Hive.box('pdp online');
    box.put("user", user1.toJson());

    var user2 = User.fromJson(box.get("user"));
    print(user2.userName);
    print(user2.password);
  }
}