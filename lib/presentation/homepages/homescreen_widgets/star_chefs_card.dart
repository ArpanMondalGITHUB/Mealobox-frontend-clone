import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealoboxclone/models/star_chefs_data.dart';

class StarChefsCard extends StatefulWidget {
  const StarChefsCard({super.key});

  @override
  State<StarChefsCard> createState() => _StarChefsCardState();
}

class _StarChefsCardState extends State<StarChefsCard> {
  Future<List<Starchefs>?> loadchefscard() async {
    final rawchefscard =
        await rootBundle.loadString('assets/star_chefs_banner.json');
    await Future.delayed(const Duration(seconds: 1));
    final starchefs = starchefsDataFromJson(rawchefscard);
    return starchefs.starchefs;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Starchefs>?>(
      future: loadchefscard(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final starchefs = snapshot.data;
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final starchef = starchefs[index];
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: starchef.pic!,
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  height:
                                      MediaQuery.of(context).size.height * 0.40,
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                starchef.name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                starchef.speciality!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 12),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.white,
                                    height: 15,
                                    width: 27,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star_border_outlined,
                                          size: 6,
                                          color: Colors.green,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    '1.7 km away',
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                width: 130,
                                height: 30,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 0,
                                    ),
                                    child: const Text(
                                      'Order Now',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )
                            ],
                          ),
                        )
                      ])),
                );
              },
              itemCount: starchefs!.length,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
