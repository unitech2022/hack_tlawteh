import 'package:hack_tlawateh/modules/general/domin/entities/user.dart';

UserDetailsPref currentUser = UserDetailsPref();
String token = "";

class AppModel {
  static String token = "";
  static String lang = "";
    static String page = "";
  static String deviceToken = "";
}

class UserDetailsPref {
  String? token;

  String? id;

  String? fullName;

  String? userName;

  String? gender;

  String? country;
  String? role;

  int? classRoom;

  String? deviceToken;

  UserDetailsPref(
      {this.token,
      this.id,
      this.fullName,
      this.gender,
      this.userName,
      this.country,
      this.role,
      this.classRoom,
      this.deviceToken});
}
