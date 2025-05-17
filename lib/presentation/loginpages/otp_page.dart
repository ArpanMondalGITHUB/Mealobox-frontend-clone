import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/global/widgets/button.dart';
import 'package:mealoboxclone/main_page.dart';

class OtpPage extends StatefulWidget {
  // final String phoneNumber; // Phone number to show on the OTP page
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallete.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('OTP verification'),
        backgroundColor: Appallete.whiteColor,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Enter the 4+digit code sent to',
                style: TextStyle(fontSize: 20),
              ),
              Text('the phone number'),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 50,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                }),
              ),
              
              Button(
                  text: 'Continue',
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MainPage()));
                  }),
             
              Text("Didn't recieve the OTP?")
            ],
          ),
        ),
      ),
    );
  }
}
