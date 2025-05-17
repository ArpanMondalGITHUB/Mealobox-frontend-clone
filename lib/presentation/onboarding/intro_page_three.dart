import 'package:flutter/material.dart';
import 'package:mealoboxclone/presentation/loginpages/login_option_page.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/global/widgets/button.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallete.intropagethree,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/rajma.jpg'),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Unlock Homemade Happiness',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Start you journey with MealoBox and enjoy the taste of home , anywhere you are',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              text: 'Get Started',
              ontap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginOptionPage(),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
