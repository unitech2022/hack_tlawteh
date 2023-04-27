import 'package:hack_tlawateh/modules/general/data/models/add_model.dart';
import 'package:hack_tlawateh/modules/general/data/models/category_model.dart';
import 'package:hack_tlawateh/modules/general/data/models/teacher_model.dart';
import 'package:hack_tlawateh/modules/general/data/models/user_response_model.dart';

import '../../domin/entities/home_response.dart';

class HomeResponseModel extends HomeResponse {
  HomeResponseModel(
      {required super.userDetail,
      required super.adds,
      required super.teachers,
      required super.categories});

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
          userDetail: UserModel.fromJson(json["userDetail"]),
          adds: List<AddModel>.from(
              (json['adds'] as List).map((e) => AddModel.fromJson(e))),
          teachers: List<TeacherModel>.from(
              (json['teachers'] as List).map((e) => TeacherModel.fromJson(e))),
          categories: List<CategoryModel>.from((json['categories'] as List)
              .map((e) => CategoryModel.fromJson(e))));
}
