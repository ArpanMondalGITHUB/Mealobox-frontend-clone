import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/models/breakfast.dart';

class Breakfast extends StatefulWidget {
  const Breakfast({super.key});

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  Future<List<Breakfastitems>?> loadBreakfastItems() async {
    final rawbreakfastItems =
        await rootBundle.loadString('assets/breakfast.json');
    await Future.delayed(const Duration(seconds: 1));
    final breakfastitems = breakfastDataDataFromJson(rawbreakfastItems);
    return breakfastitems.breakfastitems;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Breakfastitems>?>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final breakfastitems = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final breakfastitem = breakfastitems[index];
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.34,
                  width: MediaQuery.sizeOf(context).width * 0.35,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: breakfastitem.image!,
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        const Positioned(
                          top: 8,
                          right: 8,
                          child: Icon(
                            Icons.favorite_border,
                            color: Appallete.whiteColor,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, left: 6),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      breakfastitem.name!,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.visible,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      "Kabita's Kitchen",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "₹${breakfastitem.price.toString()}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 5, bottom: 5),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Appallete.gradient1,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6))),
                                            child: const Text(
                                              'Add',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: breakfastitems!.length,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
      future: loadBreakfastItems(),
    );
  }
}
