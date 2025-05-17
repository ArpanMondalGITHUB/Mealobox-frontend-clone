import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/models/main_model.dart';

class SlideableBanners extends StatelessWidget {
 final List<Banners>? banners;
 const SlideableBanners({super.key,required this.banners});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
              itemCount: banners!.length,
              itemBuilder: (context, index, realIndex) {
                final banner = banners?[index];
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: banner!.image.toString(),
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,

                            backgroundColor: Appallete
                                .whiteColor, // Match your desired style
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text(
                            'Order Now',
                            style: TextStyle(
                                color: Appallete.gradient1,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                  enlargeCenterPage: false,
                  viewportFraction: 0.96,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.hardEdge));
        }
}

