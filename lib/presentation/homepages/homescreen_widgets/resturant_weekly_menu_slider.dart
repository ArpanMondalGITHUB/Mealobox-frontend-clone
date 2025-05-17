import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/models/main_model.dart';

class ResturantWeeklyMenuSlider extends StatefulWidget {
  final List<Homekitchen>? homekitchen;
  const ResturantWeeklyMenuSlider({
    super.key,
    required this.homekitchen,
  });

  @override
  State<ResturantWeeklyMenuSlider> createState() =>
      _ResturantWeeklyMenuSliderState();
}

class _ResturantWeeklyMenuSliderState extends State<ResturantWeeklyMenuSlider> {
  // final CarouselController _carouselController = CarouselController();
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int activeIndex = 0;
  void _handleDayTap(int index) {
    setState(() {
      activeIndex = index;
    });
    carouselController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      // mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: widget.homekitchen!.length,
          itemBuilder: (context, index, realIndex) {
            final banner = widget.homekitchen![index];
            return Card(
              elevation: 4,
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: banner.weeklymenu![index].thalipic.toString(),
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,
                      ),
                      height: MediaQuery.sizeOf(context).height * 0.025,
                      width: MediaQuery.sizeOf(context).width * 0.194,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          banner.weeklymenu![index].dayname.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 80,
                      left: 40,
                      child: Text(
                        'SPECIAL THALI',
                        style: TextStyle(
                            color: Appallete.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                  Positioned(
                      top: 100,
                      left: 40,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.222,
                        height: MediaQuery.sizeOf(context).height * 0.625,
                        child: Text(
                          maxLines: 3,
                          overflow: TextOverflow.visible,
                          banner.weeklymenu![index].fooditems.toString(),
                          style: const TextStyle(
                              color: Appallete.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 9),
                        ),
                      ))
                ],
              ),
            );
          },
          options: CarouselOptions(
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
              enlargeCenterPage: true,
              viewportFraction: 0.90,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              pageSnapping: true,
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.hardEdge),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 2,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0;
                i < widget.homekitchen!.first.weeklymenu!.length;
                i++)
              GestureDetector(
                onTap: () => _handleDayTap(i),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  width: MediaQuery.sizeOf(context).width * 0.138,
                  child: Card(
                    elevation: 5,
                    clipBehavior: Clip.hardEdge,
                    shape: const BeveledRectangleBorder(),
                    color: activeIndex == i
                        ? Appallete.gradient1
                        : Appallete.whiteColor,
                    child: Center(
                      child: Text(
                        widget.homekitchen!.first.weeklymenu![i].dayname
                            .toString()
                            .substring(0, 3),
                        style: TextStyle(
                            overflow: TextOverflow.fade,
                            color: activeIndex == i
                                ? Appallete.whiteColor
                                : Colors.grey,
                            fontSize: 12,
                            fontWeight: activeIndex == i
                                ? FontWeight.bold
                                : FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
