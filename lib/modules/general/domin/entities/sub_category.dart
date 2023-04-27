import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class SubCategory extends Equatable {
  final int categoryId;
    final int id;
  final String name;
  final String desc;
  final String image;
  final String color;
  SubCategory({required this.categoryId, required this.id, required this.name, required this.desc, required this.image, required this.color});


    @override
  // TODO: implement props
  List<Object?> get props =>[
    id,name,desc,image,color,categoryId
  ];
}
