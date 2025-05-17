import 'dart:convert';

LunchData lunchDataFromJson(String str) {
  final jsonData = json.decode(str);
  return LunchData.fromJson(jsonData);
}


String lunchDatatoJson(LunchData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


class LunchData {
  List<Lunch>? lunch;

  LunchData({this.lunch});

  LunchData.fromJson(Map<String, dynamic> json) {
    if (json['lunch'] != null) {
      lunch = <Lunch>[];
      json['lunch'].forEach((v) {
        lunch!.add(Lunch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (lunch != null) {
      data['lunch'] = lunch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lunch {
  int? id;
  String? imageUrl;
  String? name;
  int? price;

  Lunch({this.id, this.imageUrl, this.name, this.price});

  Lunch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}