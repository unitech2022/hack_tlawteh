import 'package:hack_tlawateh/modules/general/domin/entities/teacher.dart';

class TeacherModel extends Teacher {
  TeacherModel(
      {required super.id,
      required super.desc,
      required super.image,
      required super.status,
      required super.name,
      required super.bannerImage,
      required super.specialty,
      required super.userName,
      required super.country,
      required super.rate,
      required super.createdAt});

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
      id: json["id"],
      desc: json["desc"],
      image: json["image"],
      status: json["status"],
      name: json["name"],
      bannerImage: json["bannerImage"],
      specialty: json["specialty"],
      userName: json["userName"],
      country: json["country"],
      rate: json["rate"].toDouble(),
      createdAt: json["createdAt"]);
}
