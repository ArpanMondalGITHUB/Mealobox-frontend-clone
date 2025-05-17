import 'package:flutter/material.dart';
class LunchWidget extends StatefulWidget {
  const LunchWidget({super.key});

  @override
  State<LunchWidget> createState() => _LunchWidgetState();
}

class _LunchWidgetState extends State<LunchWidget> {
  // Future<List<Lunch>?> loadlunchitem() async {
  //   final rawlunchitems = await rootBundle.loadString('assets/lunch.json');
  //   await Future.delayed(const Duration(seconds: 1));
  //   final lunch = lunchDataFromJson(rawlunchitems);
  //   return lunch.lunch;
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
