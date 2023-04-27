import 'package:hack_tlawateh/modules/general/domin/entities/user.dart';

import '../../domin/entities/user_response.dart';

class UserResponseModel extends UserResponse {
  const UserResponseModel(
      {required super.token,
      required super.user,
      required super.status,
      required super.message});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
          token: json['token'],
          user: UserModel.fromJson(json['user']),
          status: json['status'],
          message: json["message"]);
}

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.fullName,
      required super.userName,
      required super.role,
      required super.deviceToken,
      required super.gender,
      required super.country,
      required super.classroom,
      required super.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      fullName: json["fullName"],
      userName: json["userName"],
      role: json["role"],
      deviceToken: json["deviceToken"],
      gender: json["gender"],
      country: json["country"],
      classroom: json["classroom"],
      createdAt: json["createdAt"]);
}

class ResponseRegister {
  final String message;
  final bool status;

  ResponseRegister({required this.message, required this.status});
  factory ResponseRegister.fromJson(Map<String, dynamic> json) {
    return ResponseRegister(message: json["message"], status: json["status"]);
  }
}
