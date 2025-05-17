import 'dart:convert';

StarchefsData starchefsDataFromJson(String str) {
  final jsonData = json.decode(str);
  return StarchefsData.fromJson(jsonData);
}


String starchefsDatatoJson(StarchefsData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}



class StarchefsData {
  List<Starchefs>? starchefs;

  StarchefsData({this.starchefs});

  StarchefsData.fromJson(Map<String, dynamic> json) {
    if (json['starchefs'] != null) {
      starchefs = <Starchefs>[];
      json['starchefs'].forEach((v) {
        starchefs!.add(Starchefs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (starchefs != null) {
      data['starchefs'] = starchefs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Starchefs {
  String? name;
  String? speciality;
  String? pic;

  Starchefs({this.name, this.speciality, this.pic});

  Starchefs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    speciality = json['speciality'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['speciality'] = speciality;
    data['pic'] = pic;
    return data;
  }
}