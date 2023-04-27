import 'package:equatable/equatable.dart';

class Teacher extends Equatable {
// "id": 2,
//             "userName": "cb7d07d6-8eac-47f4-9251-0554fdbbe96a",
//             "": "الشيخ عمار خلاف",
//             "desc": "حافظ للقرآن الكريم ومعلم بالأزهر الشربف",
//             "image": "20230420T001550.jpeg",
//             "bannerImage": "20230419T164639.jpeg",
//             "": "قرآن كريم",
//             "rate": 0,
//             "status": 0,
//             "": 0,
//             "": "مصر",
//             "": "2023-04-20T01:18:40.988755"

  final int id;
  final int status;
  final String desc;
  final String image;
  final String name;
  final String bannerImage;
  final String specialty;

  final String userName;
  final String country;

  final String createdAt;
  final double rate;

  Teacher({
    required this.id,
    required this.desc,
    required this.image,
    required this.status,
    required this.name,
    required this.bannerImage,
    required this.specialty,
    required this.userName,
    required this.country,
    required this.rate,
    required this.createdAt,
  });

  @override
  List<Object?> get props =>
      [
 id,
   desc,
   image,
   status,
   name,
   bannerImage,
   specialty,
   userName,
    country,
   rate,
    createdAt,


      ];
}
