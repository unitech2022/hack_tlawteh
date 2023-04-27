import 'package:equatable/equatable.dart';
import 'package:hack_tlawateh/modules/general/domin/entities/category.dart';

import 'package:hack_tlawateh/modules/general/domin/entities/teacher.dart';
import 'package:hack_tlawateh/modules/general/domin/entities/user.dart';

import 'add.dart';

class HomeResponse extends Equatable {
  final User userDetail;
  final List<Add> adds;
  final List<Teacher> teachers;
  final List<Category> categories;

  HomeResponse(
      {required this.userDetail,
      required this.adds,
      required this.teachers,
      required this.categories});

  @override
  // TODO: implement props
  List<Object?> get props => [userDetail, adds, teachers, categories];
}
