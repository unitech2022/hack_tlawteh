import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String fullName;
  final String userName;
  final String role;
  final String deviceToken;
  final String gender;
  final String country;
  final int classroom;
  final String createdAt;
  const User({required this.id, required this.fullName,required this.userName,required this.role,required this.deviceToken,
     required this.gender,required this.country,required this.classroom,required this.createdAt});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        fullName,
        role,
        userName,
        deviceToken,
        gender,
        country,
        classroom,
        createdAt
      ];
}
