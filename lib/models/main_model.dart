import 'dart:convert';

MealoboxmainData mealoboxmainDatafromjson(dynamic dyn) {
  final jsonData = json.decode(dyn);
  return MealoboxmainData.fromJson(jsonData);
}

String mealoboxmainDatatojson(MealoboxmainData data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}
class MealoboxmainData {
  List<Mealobox>? mealobox;

  MealoboxmainData({this.mealobox});

  MealoboxmainData.fromJson(Map<String, dynamic> json) {
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
  List<Threedayplanflexi>? threedayplanflexi;
  List<Sevendayplanflexi>? sevendayplanflexi;
  List<Fourteendayplanflexi>? fourteendayplanflexi;

  Mealobox(
      {this.banners,
      this.breakfast,
      this.lunch,
      this.dinner,
      this.starchefs,
      this.homekitchen,
      this.threedayplanflexi,
      this.sevendayplanflexi,
      this.fourteendayplanflexi});

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
    if (json['threedayplanflexi'] != null) {
      threedayplanflexi = <Threedayplanflexi>[];
      json['threedayplanflexi'].forEach((v) {
        threedayplanflexi!.add(Threedayplanflexi.fromJson(v));
      });
    }
    if (json['sevendayplanflexi'] != null) {
      sevendayplanflexi = <Sevendayplanflexi>[];
      json['sevendayplanflexi'].forEach((v) {
        sevendayplanflexi!.add(Sevendayplanflexi.fromJson(v));
      });
    }
    if (json['fourteendayplanflexi'] != null) {
      fourteendayplanflexi = <Fourteendayplanflexi>[];
      json['fourteendayplanflexi'].forEach((v) {
        fourteendayplanflexi!.add(Fourteendayplanflexi.fromJson(v));
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
    if (threedayplanflexi != null) {
      data['threedayplanflexi'] =
          threedayplanflexi!.map((v) => v.toJson()).toList();
    }
    if (sevendayplanflexi != null) {
      data['sevendayplanflexi'] =
          sevendayplanflexi!.map((v) => v.toJson()).toList();
    }
    if (fourteendayplanflexi != null) {
      data['fourteendayplanflexi'] =
          fourteendayplanflexi!.map((v) => v.toJson()).toList();
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
  String? howmanymealsserved;
  String? name;
  String? rating;
  String? speciality;
  String? serves;
  String? subscriptionprice;
  String? durationLocation;
  String? about;
  List<Weeklymenu>? weeklymenu;
  List<Whychoose>? whychoose;
  List<Deliveryhours>? deliveryhours;
  String? location;
  String? contact;
  String? price;
  String? discount;

  Homekitchen(
      {this.id,
      this.homekitchenpic,
      this.howmanymealsserved,
      this.name,
      this.rating,
      this.speciality,
      this.serves,
      this.subscriptionprice,
      this.durationLocation,
      this.about,
      this.weeklymenu,
      this.whychoose,
      this.deliveryhours,
      this.location,
      this.contact,
      this.price,
      this.discount});

  Homekitchen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homekitchenpic = json['homekitchenpic'];
    howmanymealsserved = json['howmanymealsserved'];
    name = json['name'];
    rating = json['rating'];
    speciality = json['speciality'];
    serves = json['serves'];
    subscriptionprice = json['subscriptionprice'];
    durationLocation = json['duration&location'];
    about = json['about'];
    if (json['weeklymenu'] != null) {
      weeklymenu = <Weeklymenu>[];
      json['weeklymenu'].forEach((v) {
        weeklymenu!.add(Weeklymenu.fromJson(v));
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
    price = json['price'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['homekitchenpic'] = homekitchenpic;
    data['howmanymealsserved'] = howmanymealsserved;
    data['name'] = name;
    data['rating'] = rating;
    data['speciality'] = speciality;
    data['serves'] = serves;
    data['subscriptionprice'] = subscriptionprice;
    data['duration&location'] = durationLocation;
    data['about'] = about;
    if (weeklymenu != null) {
      data['weeklymenu'] = weeklymenu!.map((v) => v.toJson()).toList();
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
    data['price'] = price;
    data['discount'] = discount;
    return data;
  }
}

class Weeklymenu {
  int? id;
  String? dayname;
  String? fooditems;
  String? thalipic;

  Weeklymenu({this.id, this.dayname, this.fooditems, this.thalipic});

  Weeklymenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayname = json['dayname'];
    fooditems = json['fooditems'];
    thalipic = json['thalipic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dayname'] = dayname;
    data['fooditems'] = fooditems;
    data['thalipic'] = thalipic;
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
  String? timename;
  String? breakfast;
  String? lunch;
  String? dinner;

  Deliveryhours({this.timename, this.breakfast, this.lunch, this.dinner});

  Deliveryhours.fromJson(Map<String, dynamic> json) {
    timename = json['timename'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timename'] = timename;
    data['breakfast'] = breakfast;
    data['lunch'] = lunch;
    data['dinner'] = dinner;
    return data;
  }
}

class Threedayplanflexi {
  int? id;
  String? howmanyday;
  int? notrupee;
  int? rupee;
  String? fooditemsname;
  int? addonid;
  String? addonnonvegname;
  int? addonnonvegprice;
  String? addonnameveg;
  int? addonveg1chapatiprice;
  String? addonnamevegcha;
  int? addonveg2chapatiprice;

  Threedayplanflexi(
      {this.id,
      this.howmanyday,
      this.notrupee,
      this.rupee,
      this.fooditemsname,
      this.addonid,
      this.addonnonvegname,
      this.addonnonvegprice,
      this.addonnameveg,
      this.addonveg1chapatiprice,
      this.addonnamevegcha,
      this.addonveg2chapatiprice});

  Threedayplanflexi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    howmanyday = json['howmanyday'];
    notrupee = json['notrupee'];
    rupee = json['rupee'];
    fooditemsname = json['fooditemsname'];
    addonid = json['addonid'];
    addonnonvegname = json['addonnonvegname'];
    addonnonvegprice = json['addonnonvegprice'];
    addonnameveg = json['addonnameveg'];
    addonveg1chapatiprice = json['addonveg1chapatiprice'];
    addonnamevegcha = json['addonnamevegcha'];
    addonveg2chapatiprice = json['addonveg2chapatiprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['howmanyday'] = howmanyday;
    data['notrupee'] = notrupee;
    data['rupee'] = rupee;
    data['fooditemsname'] = fooditemsname;
    data['addonid'] = addonid;
    data['addonnonvegname'] = addonnonvegname;
    data['addonnonvegprice'] = addonnonvegprice;
    data['addonnameveg'] = addonnameveg;
    data['addonveg1chapatiprice'] = addonveg1chapatiprice;
    data['addonnamevegcha'] = addonnamevegcha;
    data['addonveg2chapatiprice'] = addonveg2chapatiprice;
    return data;
  }
}

class Sevendayplanflexi {
  int? id;
  String? howmanyday;
  int? notrupee;
  int? rupee;
  String? fooditemsname;
  int? addonid;
  String? addonname;
  int? addonnonvegprice;
  String? addonnameveg;
  int? addonveg1chapatiprice;
  String? addonnamevegcha;
  int? addonveg2chapatiprice;

  Sevendayplanflexi(
      {this.id,
      this.howmanyday,
      this.notrupee,
      this.rupee,
      this.fooditemsname,
      this.addonid,
      this.addonname,
      this.addonnonvegprice,
      this.addonnameveg,
      this.addonveg1chapatiprice,
      this.addonnamevegcha,
      this.addonveg2chapatiprice});

  Sevendayplanflexi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    howmanyday = json['howmanyday'];
    notrupee = json['notrupee'];
    rupee = json['rupee'];
    fooditemsname = json['fooditemsname'];
    addonid = json['addonid'];
    addonname = json['addonname'];
    addonnonvegprice = json['addonnonvegprice'];
    addonnameveg = json['addonnameveg'];
    addonveg1chapatiprice = json['addonveg1chapatiprice'];
    addonnamevegcha = json['addonnamevegcha'];
    addonveg2chapatiprice = json['addonveg2chapatiprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['howmanyday'] = howmanyday;
    data['notrupee'] = notrupee;
    data['rupee'] = rupee;
    data['fooditemsname'] = fooditemsname;
    data['addonid'] = addonid;
    data['addonname'] = addonname;
    data['addonnonvegprice'] = addonnonvegprice;
    data['addonnameveg'] = addonnameveg;
    data['addonveg1chapatiprice'] = addonveg1chapatiprice;
    data['addonnamevegcha'] = addonnamevegcha;
    data['addonveg2chapatiprice'] = addonveg2chapatiprice;
    return data;
  }
}

class Fourteendayplanflexi {
  int? id;
  String? howmanyday;
  int? notrupee;
  int? rupee;
  String? fooditemsname;
  int? addonid;
  String? addonname;
  int? addonnonvegprice;
  String? addonnameveg;
  int? addonveg1chapatiprice;
  String? addonnamevegcha;
  int? addonveg2chapatiprice;

  Fourteendayplanflexi(
      {this.id,
      this.howmanyday,
      this.notrupee,
      this.rupee,
      this.fooditemsname,
      this.addonid,
      this.addonname,
      this.addonnonvegprice,
      this.addonnameveg,
      this.addonveg1chapatiprice,
      this.addonnamevegcha,
      this.addonveg2chapatiprice});

  Fourteendayplanflexi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    howmanyday = json['howmanyday'];
    notrupee = json['notrupee'];
    rupee = json['rupee'];
    fooditemsname = json['fooditemsname'];
    addonid = json['addonid'];
    addonname = json['addonname'];
    addonnonvegprice = json['addonnonvegprice'];
    addonnameveg = json['addonnameveg'];
    addonveg1chapatiprice = json['addonveg1chapatiprice'];
    addonnamevegcha = json['addonnamevegcha'];
    addonveg2chapatiprice = json['addonveg2chapatiprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['howmanyday'] = howmanyday;
    data['notrupee'] = notrupee;
    data['rupee'] = rupee;
    data['fooditemsname'] = fooditemsname;
    data['addonid'] = addonid;
    data['addonname'] = addonname;
    data['addonnonvegprice'] = addonnonvegprice;
    data['addonnameveg'] = addonnameveg;
    data['addonveg1chapatiprice'] = addonveg1chapatiprice;
    data['addonnamevegcha'] = addonnamevegcha;
    data['addonveg2chapatiprice'] = addonveg2chapatiprice;
    return data;
  }
}