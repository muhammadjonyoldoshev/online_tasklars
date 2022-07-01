import 'package:hive/hive.dart';


class DBService {
  var box = Hive.box('login_two');

  void storeUser(String saveName, String name) async {
    box.put(saveName, name);
  }

  String getUser(String saveName) {
    var name = box.get(saveName);
    return name;
  }

  void removeUser(String saveName) async {
    box.delete(saveName);
  }
}

