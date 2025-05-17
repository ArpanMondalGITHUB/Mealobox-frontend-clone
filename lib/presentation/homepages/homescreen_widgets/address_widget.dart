import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({super.key});

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:const EdgeInsets.all(18.0),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           const Text(
              'Select Location',
              style: TextStyle(
                  color: Appallete.gradient1,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            GestureDetector(
              
                onTap: () {
                 
                  Navigator.pop(context, true);
                },
              child:const Card(
                elevation: 2,
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.home),
                          Text(
                            'HOME',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                      Text(
                        'Flat no 1230',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      Text(
                        '2/4, opposite Grand High Stret Mall, adjacant to emcure,Phase 1 , Himjawadi Village,Hinjawadi,Pune,Pimpri-Chinchwad,Maharastra 411057,',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      Text(
                        'india',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      Text(
                        'Landmark:Hinjawadi',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
