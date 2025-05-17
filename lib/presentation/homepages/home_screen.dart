import 'package:flutter/material.dart';
import 'package:mealoboxclone/controllers/main_service.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/models/main_model.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/featured_lline.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/resturant_widget.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/slideable_banners.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/star_chefs_card.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/tab_based_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Mealobox>? _data;
  @override
  void initState() {
    super.initState();
    _loadalldata();
  }

  Future<void> _loadalldata() async {
    final service = MainService();
    final data = await service.fetchData();
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_data == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.location_on, color: Appallete.gradient1),
              onPressed: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hostel ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Fetching location...',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Appallete.gradient1,
                  ),
                ),
                Positioned(
                    right: 12,
                    top: 12,
                    child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: const Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        )))
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search for chefs, kitchens and cuisines',
                  hintStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                    color: Appallete.gradient1,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic_none_outlined),
                    color: Appallete.gradient1,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
            SlideableBanners(
              banners: _data!.first.banners,
            ),
            const SizedBox(
              height: 15,
            ),
            const FeaturedLine(text: "Today's featured meals"),
            const TabBasedMenu(),
            const SizedBox(
              height: 8,
            ),
            const FeaturedLine(text: 'Meet our star chefs'),
            const StarChefsCard(),
            const SizedBox(
              height: 15,
            ),
            const FeaturedLine(text: "Available Home Kitchen"),
            ResturantWidget(
              homekitchen: _data!.first.homekitchen,
              threedayplanflexi: _data!.first.threedayplanflexi,
              sevendayplanflexi: _data!.first.sevendayplanflexi,
              fourteendayplanflexi: _data!.first.fourteendayplanflexi,

              
            )
          ],
        ),
      ),
    );
  }
}
