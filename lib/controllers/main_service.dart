import 'package:flutter/services.dart';
import 'package:mealoboxclone/models/main_model.dart';

class MainService {
  Future<List<Mealobox>?> fetchData() async {
    final rawdata = await rootBundle.loadString('assets/mealobox.json');
    await Future.delayed(const Duration(seconds: 1));
    final data = mealoboxmainDatafromjson(rawdata);
    return data.mealobox;
  }
}
