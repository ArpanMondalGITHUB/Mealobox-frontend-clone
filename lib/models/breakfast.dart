import 'dart:convert';

BreakfastData breakfastDataDataFromJson(dynamic str) {
  final jsonData = json.decode(str);
  return BreakfastData.fromJson(jsonData);
}


String bannersDatatoJson(BreakfastData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


class BreakfastData {
  List<Breakfastitems>? breakfastitems;

  BreakfastData({this.breakfastitems});

  BreakfastData.fromJson(Map<String, dynamic> json) {
    if (json['breakfastitems'] != null) {
      breakfastitems = <Breakfastitems>[];
      json['breakfastitems'].forEach((v) {
        breakfastitems!.add(Breakfastitems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (breakfastitems != null) {
      data['breakfastitems'] =
          breakfastitems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Breakfastitems {
  int? id;
  String? image;
  String? name;
  int? price;

  Breakfastitems({this.id, this.image, this.name, this.price});

  Breakfastitems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}