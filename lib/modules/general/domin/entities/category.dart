import 'package:equatable/equatable.dart';

class Category extends Equatable {

  final int id;
  final String name;
  final String desc;
  final String image;
  final String color;

  Category({required this.id, required this.name, required this.desc, required this.image, required this.color});
  
  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,name,desc,image,color
  ];
}
