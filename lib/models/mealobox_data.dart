import 'dart:convert';

MealoboxData mealoboxDataFromJson(dynamic str) {
  final jsonData = json.decode(str);
  return MealoboxData.fromJson(jsonData);
}


String mealoboxDatatoJson(MealoboxData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


class MealoboxData {
  List<Mealobox>? mealobox;

  MealoboxData({this.mealobox});

  MealoboxData.fromJson(Map<String, dynamic> json) {
    if (json['mealobox'] != null) {
      mealobox = <Mealobox>[];
      json['mealobox'].forEach((v) {
        mealobox!.add(Mealobox.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mealobox != null) {
      data['mealobox'] = mealobox!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mealobox {
  List<Banners>? banners;
  List<Breakfast>? breakfast;
  List<Lunch>? lunch;
  List<Dinner>? dinner;
  List<Starchefs>? starchefs;
  List<Homekitchen>? homekitchen;

  Mealobox(
      {this.banners,
      this.breakfast,
      this.lunch,
      this.dinner,
      this.starchefs,
      this.homekitchen});

  Mealobox.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    if (json['breakfast'] != null) {
      breakfast = <Breakfast>[];
      json['breakfast'].forEach((v) {
        breakfast!.add(Breakfast.fromJson(v));
      });
    }
    if (json['lunch'] != null) {
      lunch = <Lunch>[];
      json['lunch'].forEach((v) {
        lunch!.add(Lunch.fromJson(v));
      });
    }
    if (json['dinner'] != null) {
      dinner = <Dinner>[];
      json['dinner'].forEach((v) {
        dinner!.add(Dinner.fromJson(v));
      });
    }
    if (json['starchefs'] != null) {
      starchefs = <Starchefs>[];
      json['starchefs'].forEach((v) {
        starchefs!.add(Starchefs.fromJson(v));
      });
    }
    if (json['homekitchen'] != null) {
      homekitchen = <Homekitchen>[];
      json['homekitchen'].forEach((v) {
        homekitchen!.add(Homekitchen.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (breakfast != null) {
      data['breakfast'] = breakfast!.map((v) => v.toJson()).toList();
    }
    if (lunch != null) {
      data['lunch'] = lunch!.map((v) => v.toJson()).toList();
    }
    if (dinner != null) {
      data['dinner'] = dinner!.map((v) => v.toJson()).toList();
    }
    if (starchefs != null) {
      data['starchefs'] = starchefs!.map((v) => v.toJson()).toList();
    }
    if (homekitchen != null) {
      data['homekitchen'] = homekitchen!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}

class Breakfast {
  int? id;
  String? image;
  String? name;
  int? price;

  Breakfast({this.id, this.image, this.name, this.price});

  Breakfast.fromJson(Map<String, dynamic> json) {
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

class Lunch {
  int? id;
  String? image;
  String? name;
  int? price;

  Lunch({this.id, this.image, this.name, this.price});

  Lunch.fromJson(Map<String, dynamic> json) {
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

class Dinner {
  int? id;
  String? image;
  String? name;
  int? price;

  Dinner({this.id, this.image, this.name, this.price});

  Dinner.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['speciality'] = speciality;
    data['pic'] = pic;
    return data;
  }
}

class Homekitchen {
  int? id;
  String? homekitchenpic;
  String? discount;
  String? howmanymealsserved;
  String? name;
  String? rating;
  String? speciality;
  String? serves;
  String? price;
  String? durationLocation;
  String? about;
  List<Photoesoffoods>? photoesoffoods;
  List<Whychoose>? whychoose;
  List<Deliveryhours>? deliveryhours;
  String? location;
  String? contact;

  Homekitchen(
      {this.id,
      this.homekitchenpic,
      this.discount,
      this.howmanymealsserved,
      this.name,
      this.rating,
      this.speciality,
      this.serves,
      this.price,
      this.durationLocation,
      this.about,
      this.photoesoffoods,
      this.whychoose,
      this.deliveryhours,
      this.location,
      this.contact});

  Homekitchen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homekitchenpic = json['homekitchenpic'];
    discount = json['discount'];
    howmanymealsserved = json['howmanymealsserved'];
    name = json['name'];
    rating = json['rating'];
    speciality = json['speciality'];
    serves = json['serves'];
    price = json['price'];
    durationLocation = json['duration&location'];
    about = json['about'];
    if (json['photoesoffoods'] != null) {
      photoesoffoods = <Photoesoffoods>[];
      json['photoesoffoods'].forEach((v) {
        photoesoffoods!.add(Photoesoffoods.fromJson(v));
      });
    }
    if (json['whychoose'] != null) {
      whychoose = <Whychoose>[];
      json['whychoose'].forEach((v) {
        whychoose!.add(Whychoose.fromJson(v));
      });
    }
    if (json['deliveryhours'] != null) {
      deliveryhours = <Deliveryhours>[];
      json['deliveryhours'].forEach((v) {
        deliveryhours!.add(Deliveryhours.fromJson(v));
      });
    }
    location = json['location'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['homekitchenpic'] = homekitchenpic;
    data['discount'] = discount;
    data['howmanymealsserved'] = howmanymealsserved;
    data['name'] = name;
    data['rating'] = rating;
    data['speciality'] = speciality;
    data['serves'] = serves;
    data['price'] = price;
    data['duration&location'] = durationLocation;
    data['about'] = about;
    if (photoesoffoods != null) {
      data['photoesoffoods'] =
          photoesoffoods!.map((v) => v.toJson()).toList();
    }
    if (whychoose != null) {
      data['whychoose'] = whychoose!.map((v) => v.toJson()).toList();
    }
    if (deliveryhours != null) {
      data['deliveryhours'] =
          deliveryhours!.map((v) => v.toJson()).toList();
    }
    data['location'] = location;
    data['contact'] = contact;
    return data;
  }
}

class Photoesoffoods {
  String? pic1;
  String? pic2;
  String? pic3;

  Photoesoffoods({this.pic1, this.pic2, this.pic3});

  Photoesoffoods.fromJson(Map<String, dynamic> json) {
    pic1 = json['pic1'];
    pic2 = json['pic2'];
    pic3 = json['pic3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pic1'] = pic1;
    data['pic2'] = pic2;
    data['pic3'] = pic3;
    return data;
  }
}

class Whychoose {
  String? vegornonveg;
  String? typeofpackaging;
  String? ismicrowavesafe;
  String? homemade;

  Whychoose(
      {this.vegornonveg,
      this.typeofpackaging,
      this.ismicrowavesafe,
      this.homemade});

  Whychoose.fromJson(Map<String, dynamic> json) {
    vegornonveg = json['vegornonveg'];
    typeofpackaging = json['typeofpackaging'];
    ismicrowavesafe = json['ismicrowavesafe'];
    homemade = json['homemade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vegornonveg'] = vegornonveg;
    data['typeofpackaging'] = typeofpackaging;
    data['ismicrowavesafe'] = ismicrowavesafe;
    data['homemade'] = homemade;
    return data;
  }
}

class Deliveryhours {
  String? breakfast;
  String? lunch;
  String? dinner;

  Deliveryhours({this.breakfast, this.lunch, this.dinner});

  Deliveryhours.fromJson(Map<String, dynamic> json) {
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['breakfast'] = breakfast;
    data['lunch'] = lunch;
    data['dinner'] = dinner;
    return data;
  }
}