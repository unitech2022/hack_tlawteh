import 'package:hack_tlawateh/modules/quran/data/models/surah_model.dart';

class QuranResponse {
  List<SurahModel>? surahs;
  List<Ajzaa>? ajzaa;

  QuranResponse({this.surahs, this.ajzaa});

  QuranResponse.fromJson(Map<String, dynamic> json) {
    if (json['surahs'] != null) {
      surahs = [];
      json['surahs'].forEach((v) {
        surahs!.add(new SurahModel.fromJson(v));
      });
    }
    if (json['ajzaa'] != null) {
      ajzaa = <Ajzaa>[];
      json['ajzaa'].forEach((v) {
        ajzaa!.add(new Ajzaa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.surahs != null) {
      data['surahs'] = this.surahs!.map((v) => v.toJson()).toList();
    }
    if (this.ajzaa != null) {
      data['ajzaa'] = this.ajzaa!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Ajzaa {
  int? id;
  String? name;
  String? pages;

  Ajzaa({this.id, this.name, this.pages});

  Ajzaa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['pages'] = this.pages;
    return data;
  }
}