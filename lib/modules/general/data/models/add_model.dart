import '../../domin/entities/add.dart';

class AddModel extends Add {
  AddModel(
      {required super.id,
      required super.desc,
      required super.image,
      required super.status,
      required super.connect,
      required super.expiredAt,
      required super.createdAt});

  factory AddModel.fromJson(Map<String, dynamic> json) => AddModel(
      id: json["id"],
      desc: json["desc"],
      image: json["image"],
      status: json["status"],
      connect: json["connect"],
      expiredAt: json["expiredAt"],
      createdAt: json["createdAt"]);
}
