import 'dart:convert';

DinnerData dinnerDataFromJson(Map<String,dynamic> dyn) {
  final jsonData = json.decode(dyn as dynamic);
  return DinnerData.fromJson(jsonData);
}

String dinnerDatatoJson(DinnerData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class DinnerData {
  List<Dinner>? dinner;

  DinnerData({this.dinner});

  DinnerData.fromJson(Map<String, dynamic> json) {
    if (json['dinner'] != null) {
      dinner = <Dinner>[];
      json['dinner'].forEach((v) {
        dinner!.add(Dinner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (dinner != null) {
      data['dinner'] = dinner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dinner {
  int? id;
 late String imageUrl;
  String? name;
  int? price;

  Dinner({this.id,required this.imageUrl, this.name, this.price});

  Dinner.fromJson(Map<String, dynamic> json) {
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
