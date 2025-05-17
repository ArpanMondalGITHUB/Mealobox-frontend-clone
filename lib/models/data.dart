import 'dart:convert';

BannersData bannersDataFromJson(String str) {
  final jsonData = json.decode(str);
  return BannersData.fromJson(jsonData);
}


String bannersDatatoJson(BannersData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


class BannersData {
  List<Banners>? banners;

  BannersData({this.banners});

  BannersData.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  String? id;
  String? image;

  Banners({this.id, this.image});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}
