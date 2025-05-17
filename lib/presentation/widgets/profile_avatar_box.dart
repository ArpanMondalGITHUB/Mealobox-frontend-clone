import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';

class ProfileAvatarBox extends StatelessWidget {
  const ProfileAvatarBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
              colors: [Appallete.gradient1, Appallete.gradient2],
              end: Alignment.bottomLeft,
              begin: Alignment.topRight),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 40,
            ),
            const SizedBox(width: 16),
            const Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'Arpan Mondal',
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Flexible(
                    child: Text(
                      'ap2024@gmail.com',
                      overflow: TextOverflow.visible,
                      // maxLines: 1,
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '+8764985923',
                      style: TextStyle(fontSize: 8, color: Colors.black87),
                    ),
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/images/half_logo.png',
              fit: BoxFit.cover,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
