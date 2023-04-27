import 'package:hack_tlawateh/modules/general/domin/entities/sub_category.dart';

class SubCategoryModel extends SubCategory{


  SubCategoryModel({required super.categoryId, required super.id, required super.name, required super.desc, required super.image, required super.color}
      );

 factory SubCategoryModel.fromJson(Map<String, dynamic> json)=>SubCategoryModel(
   id : json['id'],
    categoryId: json['categoryId'],
    name : json['name'],
    desc : json['desc'],
    image : json['image'],
    color : json['color'],
 );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['color'] = this.color;
    return data;
  }
}
