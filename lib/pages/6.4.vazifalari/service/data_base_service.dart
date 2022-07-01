import 'package:hive/hive.dart';
import 'package:online_tasklar/pages/6.4.vazifalari/models/user_model_two.dart';


class DBServiceTwo {
  var box = Hive.box('login_two');

  void storeUser(UserTwo user) async {
    box.put('user', user.toJson());
  }

  UserTwo getUser() {
    var name = UserTwo.fromJson(box.get('user'));
    return name;
  }

  void removeUser() async {
    box.delete('user');
  }
}