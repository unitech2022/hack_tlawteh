class SurahModel {
  String? place;
  String? type;
  int? count;
  String? title;
  String? titleAr;
  String? index;
  String? pages;
  List<Juz>? juz;

  SurahModel(
      {this.place,
      this.type,
      this.count,
      this.title,
      this.titleAr,
      this.index,
      this.pages,
      this.juz});

  SurahModel.fromJson(Map<String, dynamic> json) {
    place = json['place'];
    type = json['type'];
    count = json['count'];
    title = json['title'];
    titleAr = json['titleAr'];
    index = json['index'];
    pages = json['pages'];
    if (json['juz'] != null) {
      juz = <Juz>[];
      json['juz'].forEach((v) {
        juz!.add(new Juz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place'] = this.place;
    data['type'] = this.type;
    data['count'] = this.count;
    data['title'] = this.title;
    data['titleAr'] = this.titleAr;
    data['index'] = this.index;
    data['pages'] = this.pages;
    if (this.juz != null) {
      data['juz'] = this.juz!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Juz {
  String? index;
  Verse? verse;

  Juz({this.index, this.verse});

  Juz.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    verse = json['verse'] != null ? new Verse.fromJson(json['verse']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    if (this.verse != null) {
      data['verse'] = this.verse!.toJson();
    }
    return data;
  }
}

class Verse {
  String? start;
  String? end;

  Verse({this.start, this.end});

  Verse.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}
