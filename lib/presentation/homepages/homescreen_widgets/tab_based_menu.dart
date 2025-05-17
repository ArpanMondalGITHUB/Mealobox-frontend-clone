import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/breakfast_widget.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/dinner_widget.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/lunch_widget.dart';

class TabBasedMenu extends StatefulWidget {
  const TabBasedMenu({super.key});

  @override
  State<TabBasedMenu> createState() => _TabBasedMenuState();
}

class _TabBasedMenuState extends State<TabBasedMenu>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: double.infinity,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Appallete.gradient1,
            indicatorWeight: 3,
            tabs: const [Text('Breakfast'), Text('Lunch'), Text('Dinner')],
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [Breakfast(), LunchWidget(), DinnerWidget()]),
          )
        ],
      ),
    );
  }
}
