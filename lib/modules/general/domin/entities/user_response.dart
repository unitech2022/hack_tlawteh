import 'package:equatable/equatable.dart';
import 'package:hack_tlawateh/modules/general/domin/entities/user.dart';

class UserResponse extends Equatable {
  final String token;
  final User user;
  final bool status;
  final String message;

  const UserResponse({required this.token,required this.user,required this.status,required this.message});
  
  @override

  List<Object?> get props => [
    token,
    user,
    status,
    message
  ];
}
