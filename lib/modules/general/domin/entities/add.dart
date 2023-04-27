import 'package:equatable/equatable.dart';

class Add extends Equatable {
  final int id;
  final int status;    
  final String desc;
  final String image;
  final String connect;
  final String expiredAt;
  final String createdAt;

  Add({required this.id, required this.desc, required this.image, required this.status,required this.connect, required this.expiredAt, required this.createdAt,});
  
  @override
  
  List<Object?> get props =>[
    id,desc,image,expiredAt,createdAt,connect,status

  ];
}
