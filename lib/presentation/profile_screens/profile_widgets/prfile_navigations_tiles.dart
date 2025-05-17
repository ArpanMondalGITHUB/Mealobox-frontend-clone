import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';

class ProfileNavigations extends StatelessWidget {
  final IconData leadingIcon;

  final String titletext;
  
  const ProfileNavigations({
    super.key,
    required this.leadingIcon,
    required this.titletext,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        color: Appallete.profiletilescolor,
      ),
      child: ListTile(
        leading:
            Icon(leadingIcon, color: Appallete.profiletilesiconcolor),
        title: Text(
          titletext,
          style: const TextStyle(
              color: Colors.black87, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        trailing:const Icon(
          
            Icons.arrow_forward_outlined,
          
          color: Appallete.profiletilesiconcolor,
        ),
      ),
    );
  }
}
