import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/widgets/socialbutton.dart';
import 'package:mealoboxclone/presentation/loginpages/phone_login_page.dart';

class LoginOptionPage extends StatefulWidget {
  const LoginOptionPage({super.key});

  @override
  State<LoginOptionPage> createState() => _LoginOptionPageState();
}

class _LoginOptionPageState extends State<LoginOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/high-angle-indian-food-assortment.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Desi Dabba!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Where every bite feels like home.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80), // Space between title and buttons

              // Google Sign-in Button
              Socialbutton(
                icon: Icons.apple,
                text: 'Continue with Google',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onTap: () {
                  // Handle Google sign-in
                },
              ),
              SizedBox(height: 16),

              // Apple Sign-in Button
              Socialbutton(
                icon: Icons.apple,
                text: 'Continue with Apple',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onTap: () {
                  // Handle Apple sign-in
                },
              ),
              SizedBox(height: 16),
              // "Or" text
              Text(
                'or',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),

              SizedBox(height: 16),
              // Phone Sign-in Button
              Socialbutton(
                icon: Icons.phone,
                text: 'Continue with Phone',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ]),
    );
  }
}
