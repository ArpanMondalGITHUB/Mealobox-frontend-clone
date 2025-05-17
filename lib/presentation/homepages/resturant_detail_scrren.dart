import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/models/main_model.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/featured_lline.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/resturant_weekly_menu_slider.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/plan_flexi_card.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/animated_counter_button.dart';

class ResturantDetailScrren extends StatefulWidget {
  final List<Homekitchen>? homekitchen;
  final List<Threedayplanflexi>? threedayplanflexi;
  final List<Sevendayplanflexi>? sevendayplanflexi;
  final List<Fourteendayplanflexi>? fourteendayplanflexi;
  const ResturantDetailScrren(
      {super.key,
      required this.homekitchen,
      required this.threedayplanflexi,
      required this.sevendayplanflexi,
      required this.fourteendayplanflexi});

  @override
  State<ResturantDetailScrren> createState() => _ResturantDetailScrrenState();
}

class _ResturantDetailScrrenState extends State<ResturantDetailScrren> {
  List<bool> isaniMate = [false, false, false];
  List<bool> ischeckboxselected = [false, false, false];
  List<bool> isContentVisible = [false, false, false];
  List<int> itemCount = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          // title: Text(
          //   'Back',
          //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          // ),
          ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 10,
          children: [
            const FeaturedLine(text: 'MENU OF THE WEEK'),
            ResturantWeeklyMenuSlider(
              homekitchen: widget.homekitchen,
            ),
            const FeaturedLine(text: 'MEAL PLANS'),
            Column(
              spacing: 20,
              children: [
                PlanFlexiCard(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  howmanydayplantext:
                      widget.threedayplanflexi!.first.howmanyday.toString(),
                  notrupee: widget.threedayplanflexi!.first.notrupee.toString(),
                  rupee: widget.threedayplanflexi!.first.rupee.toString(),
                  customButton: AnimatedCounterButton(
                    price: widget.threedayplanflexi!.first.rupee.toString(),
                    color: Appallete.gradient1,
                    onCountChanged: (p0) {
                      setState(() {
                        itemCount[0] = p0;
                        isaniMate[0] = p0 > 0;
                        isContentVisible[0] = p0 > 0;
                      });
                    },
                  ),
                  height: isaniMate[0] ? 250 : 150,
                  centerText: 'would you like to add some addons',
                  checkboxnonvegtext: 'Every Day Non-Veg',
                  value: ischeckboxselected[0],
                  checkboxonChanged: (value) {
                    setState(() {
                      ischeckboxselected[0] = value!;
                    });
                  },
                  checkboxonechapatitext: '1 Chapati Extra',
                  checkboxtwochapatitext: '2 Chapati Extra',
                  img: 'assets/images/everyday_non_veg.jpg',
                  isContentVisible: isContentVisible[0],
                ),
                PlanFlexiCard(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  howmanydayplantext:
                      widget.sevendayplanflexi!.first.howmanyday.toString(),
                  notrupee: widget.sevendayplanflexi!.first.notrupee.toString(),
                  rupee: widget.sevendayplanflexi!.first.rupee.toString(),
                  customButton: AnimatedCounterButton(
                    price:  widget.sevendayplanflexi!.first.rupee.toString(),
                    color: Appallete.gradient1,
                    onCountChanged: (p0) {
                      setState(() {
                        itemCount[1] = p0;
                        isaniMate[1] = p0 > 0;
                        isContentVisible[1] = p0 > 0;
                      });
                    },
                  ),
                  height: isaniMate[1] ? 250 : 150,
                  centerText: 'would you like to add some addons',
                  checkboxnonvegtext: 'Every Day Non-Veg',
                  value: ischeckboxselected[1],
                  checkboxonChanged: (value) {
                    setState(() {
                      ischeckboxselected[1] = value!;
                    });
                  },
                  checkboxonechapatitext: '1 Chapati Extra',
                  checkboxtwochapatitext: '2 Chapati Extra',
                  img: 'assets/images/everyday_non_veg.jpg',
                  isContentVisible: isContentVisible[1],
                ),
                PlanFlexiCard(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  howmanydayplantext:
                      widget.fourteendayplanflexi!.first.howmanyday.toString(),
                  notrupee:
                      widget.fourteendayplanflexi!.first.notrupee.toString(),
                  rupee: widget.fourteendayplanflexi!.first.rupee.toString(),
                  customButton: AnimatedCounterButton(
                    price: widget.fourteendayplanflexi!.first.rupee.toString(),
                    
                    color: Appallete.gradient1,
                    onCountChanged: (p0) {
                      setState(() {
                        itemCount[2] = p0;
                        isaniMate[2] = p0 > 0;
                        isContentVisible[2] = p0 > 0;
                      });
                    },
                  ),
                  height: isaniMate[2] ? 250 : 150,
                  centerText: 'would you like to add some addons',
                  checkboxnonvegtext: 'Every Day Non-Veg',
                  value: ischeckboxselected[2],
                  checkboxonChanged: (value) {
                    setState(() {
                      ischeckboxselected[2] = value!;
                    });
                  },
                  checkboxonechapatitext: '1 Chapati Extra',
                  checkboxtwochapatitext: '2 Chapati Extra',
                  img: 'assets/images/everyday_non_veg.jpg',
                  isContentVisible: isContentVisible[2],
                ),
              ],
            ),
            const FeaturedLine(text: 'WHY WE NEED THIS'),
            Image.asset(
              'assets/images/footer.jpeg',
              fit: BoxFit.contain,
              // height: MediaQuery.sizeOf(context).height * ,
              width: MediaQuery.sizeOf(context).width,
            )
          ],
        ),
      ),
    );
  }
}
