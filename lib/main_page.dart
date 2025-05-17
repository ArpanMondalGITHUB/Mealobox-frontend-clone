import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/presentation/homepages/home_screen.dart';
import 'package:mealoboxclone/presentation/profile_screens/profile_screen.dart';
import 'package:mealoboxclone/presentation/subscription_page/subscription_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentindex = 0;
  List<Widget> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const SubscriptionScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentindex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (int index) {
          setState(() {
            _currentindex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor:Appallete.gradient1,
        unselectedItemColor: Colors.black54,
        elevation: 3,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            activeIcon: Icon(Icons.subscriptions),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
