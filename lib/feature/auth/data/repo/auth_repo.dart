import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/helper/app_String.dart';
import 'package:taskati/feature/auth/data/models/user_model.dart';

class AuthRepo {
  var box = Hive.box<UserModel>(AppString.userBox);
  saveUserData(UserModel user) {
    try {
      box.put(AppString.userKey, user);
      return true;
    } catch (e) {
      return false;
    }
  }
}
