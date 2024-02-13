
import 'package:tour_app/hive/hive_details.dart';
import '../models/user.dart';

class HiveController {

  static void createAndSaveUser (
      String username,
      String mail,
      String phone,
      String password) async {

    var user = User(
        username: username,
        mail: mail,
        phone: phone,
        password: password);
    
    userBox.add(user);
  }

  static void updateUserDetails (
      String username,
      String mail,
      String phone,
      String password) async {

    var user = User(
        username: username,
        mail: mail,
        phone: phone,
        password: password);

    userBox.putAt(0, user);
  }

  static User getUser()  {
     return userBox.getAt(0);
  }

  static Future<void> removeAllUser()  async {
    await userBox.clear();
  }
}