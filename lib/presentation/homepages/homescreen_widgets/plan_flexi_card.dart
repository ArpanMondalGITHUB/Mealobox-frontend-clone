import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/custom_snackbar.dart';

class PlanFlexiCard extends StatelessWidget {
  final Widget customButton;
  final bool isContentVisible;
  final String centerText;
  final Curve curve;
  final String checkboxonechapatitext;
  final String checkboxtwochapatitext;
  final String checkboxnonvegtext;
  final ValueChanged<bool?>? checkboxonChanged;
  final bool value;
  final String img;
  final Duration duration;
  final String howmanydayplantext;
  final double height;
  final String notrupee;
  final String rupee;
  const PlanFlexiCard(
      {super.key,
      required this.customButton,
      required this.isContentVisible,
      required this.centerText,
      required this.curve,
      required this.checkboxonechapatitext,
      required this.checkboxtwochapatitext,
      required this.checkboxnonvegtext,
      required this.checkboxonChanged,
      required this.value,
      required this.img,
      required this.duration,
      required this.height,
      required this.howmanydayplantext,
      required this.notrupee,
      required this.rupee});

  @override
  Widget build(BuildContext context) {
    //use the mediaquery on resturant detail screen
    // double height = MediaQuery.sizeOf(context).height * 0.187;
    // double _height = 150.0;
    return AnimatedContainer(
        clipBehavior: Clip.antiAlias,
        curve: curve,
        height: height,
        width: MediaQuery.sizeOf(context).width * 0.97,
        duration: duration,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade100,
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                  spreadRadius: BorderSide.strokeAlignOutside,
                  blurRadius: BorderSide.strokeAlignOutside,
                  blurStyle: BlurStyle.inner,
                  color: Colors.black26,
                  offset: Offset(1, 2))
            ],
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                // the plan name and the icon
                Row(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.center_focus_strong,
                      color: Appallete.gradient1,
                    ),
                    Text(
                      howmanydayplantext,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                //close the plan name and the icon

                // the notrupee, ruppe and the  animated button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 6,
                      children: [
                        Text(
                          '₹$notrupee',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey.shade400),
                        ),
                        Text(
                          '₹$rupee',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Appallete.gradient1),
                        ),
                      ],
                    ),

                    // Todo ..Here will come the Animated Button
                    customButton
                  ],
                ),

                Text.rich(TextSpan(
                    text: '3 Chapati/Roti,...',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          text: ' readmore ',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Appallete.gradient1,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              CustomSnackbar.show(
                                  notrupee: '₹$notrupee',
                                  duration: const Duration(seconds: 20),
                                  content:
                                      '3 Chapati/Roti,2 veg curry Dry Dal,1 Steamed Rice,Cut Salad,Sweet',
                                  rupee: '₹$rupee',
                                  context: context,
                                  title: howmanydayplantext,
                                  img: 'assets/images/rajma.jpg');
                            }),
                    ])),
                Visibility(
                    visible: isContentVisible,
                    child: Expanded(
                      child: Column(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            centerText,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ))),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  checkColor: Appallete.whiteColor,
                                  activeColor: Appallete.gradient1,
                                  value: value,
                                  onChanged: checkboxonChanged,
                                ),
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(img),
                                ),
                                Text(
                                  checkboxnonvegtext,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(img),
                                ),
                                const Text(
                                  '1 Chapati Extra',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(img),
                                ),
                                const Text(
                                  '2 Chapati Extra',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ]),
        ));
  }
}
