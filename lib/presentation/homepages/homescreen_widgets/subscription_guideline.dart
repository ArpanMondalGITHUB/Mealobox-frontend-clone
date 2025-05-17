import 'package:flutter/material.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/subscription_guide_text.dart';

class SubscriptionGuideline extends StatelessWidget {
  const SubscriptionGuideline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subscription Guidelines',
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/man_cooking.jpeg')),
                  ),
                  Card(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/lady_cooking.jpeg')),
                  ),
                  Card(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/man_cooking.jpeg')),
                  ),
                  Card(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/lady_cooking.jpeg')),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Hi I am Kaveri. i am a homecgef working with Mealobox . people call me Kaveri Amma with Love . I coock delicious & gealthy meals for all of you .jvjhs fvjns fjlhsbfvf dfdfmn slfuhsfn v sjbfvus fvmns f usbfnsfljbslfv m,  jsfbvurfvmsfiuvsfmnbsurfbmnf  jsfbvusbfm  s  bsuofbvmnf vjlhbfvuhbsfmv jshdfbvjlhs fjbsfulhv sfm, suhdbdvjns f jhsbdfdfj sfnbvuhshf  s fjhbfjlv jsn f",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Divider(),
            Text(
              'Know more about your subscription !',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
            ),
            NumberedText(
              items: [
                "once a number is entered for the subscription it cannnot be changed as it is a uniquie ID create for a single",
                "once a number is entered for the subscription it cannnot be changed as it is a uniquie ID create for a single",
                "once a number is entered for the subscription it cannnot be changed as it is a uniquie ID create for a single",
                "once a number is entered for the subscription it cannnot be changed as it is a uniquie ID create for a single",
                "once a number is entered for the subscription it cannnot be changed as it is a uniquie ID create for a single",
                "once a number is entered for the subscription it cannnot be changed as it is a uniquie ID create for a single",
                "once a number is entered for the subscription it cannnot be changed as it is a uniquie ID create for a single",
                "once a number is entered for the subscription it cannnot be changed as it is a uniquie ID create for a single",
                "once a number is entered for the subscription it cannnot be changed as it is a uniquie ID create for a single",
              ],
              fontSize: 16.0,
              spacing: 16.0,
            )
          ],
        ),
      ),
    );
  }
}
