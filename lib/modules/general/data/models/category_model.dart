import '../../domin/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel(
      {required super.id,
      required super.name,
      required super.desc,
      required super.image,
      required super.color});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
      id: json["id"],
      name: json["name"],
      desc: json["desc"],
      image: json["image"],
      color: json["color"]);
}
