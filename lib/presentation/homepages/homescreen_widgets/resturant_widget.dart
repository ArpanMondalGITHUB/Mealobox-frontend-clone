import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/models/main_model.dart';
import 'package:mealoboxclone/presentation/homepages/resturant_detail_scrren.dart';

class ResturantWidget extends StatefulWidget {
  final List<Homekitchen>? homekitchen;
  final List<Threedayplanflexi>? threedayplanflexi;
  final List<Sevendayplanflexi>? sevendayplanflexi;
  final List<Fourteendayplanflexi>? fourteendayplanflexi;

  const ResturantWidget({super.key, required this.homekitchen,
  required this.threedayplanflexi,required this.fourteendayplanflexi,required this.sevendayplanflexi});

  @override
  State<ResturantWidget> createState() => _ResturantWidgetState();
}

class _ResturantWidgetState extends State<ResturantWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      clipBehavior: Clip.hardEdge,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.homekitchen!.length,
      itemBuilder: (context, index) {
        final kitchenlist = widget.homekitchen?[index];
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width * 0.30,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResturantDetailScrren(
                      homekitchen: widget.homekitchen,
                      threedayplanflexi: widget.threedayplanflexi,
                      fourteendayplanflexi: widget.fourteendayplanflexi,
                      sevendayplanflexi: widget.sevendayplanflexi,
                    ),
                  ));
            },
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: 'kitchen-${kitchenlist!.id}',
                        child: CachedNetworkImage(
                          imageUrl: kitchenlist.homekitchenpic!,
                          fit: BoxFit.cover,
                        ),
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
                    // Positioned(
                    //     top: 0,
                    //     left: 8,
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(8)),
                    //       height: MediaQuery.of(context).size.height * 0.02,
                    //       width: MediaQuery.of(context).size.width * 0.2,
                    //       child: Text(
                    //         overflow: TextOverflow.clip,
                    //         kitchenlist.howmanymealsserved!,
                    //         style: TextStyle(fontSize: 6),
                    //       ),
                    //     )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.sizeOf(context).width * 0.02),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                kitchenlist.name!,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    kitchenlist.speciality!,
                                    overflow: TextOverflow.visible,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Appallete.gradient1,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height: 20,
                                      width: 27,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            kitchenlist.rating!,
                                            style: const TextStyle(
                                                fontSize: 9,
                                                color: Appallete.whiteColor),
                                          ),
                                          const Icon(
                                            Icons.star_outline,
                                            size: 9,
                                            color: Appallete.whiteColor,
                                          )
                                        ],
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Subscription Start from'),
                                  Text(
                                    kitchenlist.price.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
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
      },
    );
  }
}
