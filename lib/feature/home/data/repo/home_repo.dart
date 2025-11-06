import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/helper/app_String.dart';
import 'package:taskati/feature/auth/data/models/user_model.dart';

class HomeRepo {
 static var box = Hive.box<UserModel>(AppString.userBox);

 static UserModel? getUserData() {
    return box.get(AppString.userKey) as UserModel;
  }
}
