import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/presentation/profile_screens/acount_information.dart';
import 'package:mealoboxclone/presentation/profile_screens/profile_widgets/prfile_navigations_tiles.dart';
import 'package:mealoboxclone/presentation/widgets/profile_avatar_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'My Account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            const Text(
              'Help',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.help_outline_outlined))
          ],
        ),
        body: Column(children: [
          const ProfileAvatarBox(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: Appallete.whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      // have to implement animation on it show it look that it pressed 
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AcountInformationDetails(),
                            ));
                      },
                      child: const ProfileNavigations(
                        leadingIcon: Icons.group_outlined,
                        titletext: 'Account information',
                        
                      ),
                    ),
                    const Divider(
                      height: 1,
                    ),
                    const ProfileNavigations(
                      leadingIcon: Icons.subscriptions_outlined,
                      titletext: 'My Subscrition',
                      
                    ),
                    const Divider(
                      height: 1,
                    ),
                    const ProfileNavigations(
                      leadingIcon: Icons.delivery_dining_outlined,
                      titletext: 'My Delivery',
                      
                    ),
                    const Divider(
                      height: 1,
                    ),
                    const ProfileNavigations(
                      leadingIcon: Icons.payments_outlined,
                      titletext: 'Payment Method',
                      
                    ),
                    const Divider(
                      height: 1,
                    ),
                    const ProfileNavigations(
                      leadingIcon: Icons.batch_prediction_outlined,
                      titletext: 'Refer a Friend',
                     
                    ),
                    const Divider(
                      height: 1,
                    ),
                    const ProfileNavigations(
                      leadingIcon: Icons.settings_outlined,
                      titletext: 'Settings',
                     
                    ),
                    const Divider(
                      height: 1,
                    ),
                    const ProfileNavigations(
                      leadingIcon: Icons.logout_outlined,
                      titletext: 'Logout',
                      
                    ),
                  ],
                )),
          )
        ]));
  }
}
