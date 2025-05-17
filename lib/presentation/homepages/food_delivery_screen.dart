// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/address_widget.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/bill_details.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/calender.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/coupons_page.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/map_page.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/subscription_guideline.dart';
// import 'package:paytm_allinonesdk/paytm_allinonesdk.dart'

class FoodDeliveryScreen extends StatefulWidget {
  const FoodDeliveryScreen({super.key});

  @override
  State<FoodDeliveryScreen> createState() => _FoodDeliveryScreenState();
}

class _FoodDeliveryScreenState extends State<FoodDeliveryScreen> {
  bool isTreeshouldPlant = false;
  bool isSlecetAdress = false;
  bool isAddAdress = false;
  bool isLunchSelected = false;
  bool isDinnerSelected = false;
  bool ischeckboxselected = false;
  int quantity = 1;
  int selectIndex = 3;

  void _ontapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void inCreamentQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreamentQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  // Future<void> startPaytmTransaction() async {
  //   try {
  //     // Test credentials from Paytm
  //     const mid = "nwKgbR66492997372058"; // Get this from Paytm dashboard
  //     final orderId =
  //         "TEST_${DateTime.now().millisecondsSinceEpoch}"; // Make non-const since it uses DateTime
  //     const amount = "1.00"; // Use small amount for testing
  //     const txnToken = "TEST_TOKEN_1234567890"; // Test token
  //     const callbackUrl = "https://securegw-stage.paytm.in/theia/paytmCallback";
  //     var response = await AllInOneSdk.startTransaction(
  //       mid,
  //       orderId,
  //       amount,
  //       txnToken,
  //       callbackUrl,
  //       true, // Keep isStaging true for testing
  //       false, // restrictAppInvoke
  //     );

  //     print(response);
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(18),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ITEMS:',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  plan_card_widget(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      const Text(
                        'SPECIAL INSTRUCTIONS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          special_instruction('Less Salty'),
                          special_instruction('Less Oily'),
                          special_instruction('Less Spicy')
                        ],
                      ),
                      donot_cutlery(
                        'Do not send Cutlery',
                        () {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.zero, // Make it square
                                    ),
                                    content: Text(
                                        "Kitchen will be informed to not send any cutlery."),
                                  ));
                        },
                      ),
                      guildeline_charges_widget(
                        'Subscription guidline',
                        Icons.book,
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const SubscriptionGuideline()));
                        },
                      ),
                      guildeline_charges_widget(
                        'Do not pay delivery charges',
                        Icons.payments,
                        () {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.zero, // Make it square
                                    ),
                                    content: Text(
                                        "Please do not pay extra delivery charges , as the delivery has already been paidfor."),
                                  ));
                        },
                      )
                    ],
                  ),
                  select_deliver_slot(),
                  delivery_address(
                    'DELIVERY ADDRESS',
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const MapPage()));
                    },
                  ),
                  offers_and_benefits(
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CouponsPage()));
                    },
                  ),
                  bill_details(),
                  SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF9C3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "🎉",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  color: Color(0xFF1F2937),
                                  fontSize: 12,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Congratulations! You ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Saved ₹ 700.00",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " on this order.",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          adress_selection_button(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: _ontapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Appallete.borderColor,
          unselectedItemColor: Colors.grey.shade300,
          elevation: 3,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              activeIcon: Icon(Icons.subscriptions),
              label: 'Subscription',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.room_service),
              activeIcon: Icon(Icons.room_service_outlined),
              label: 'On Demand',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              activeIcon: Icon(Icons.inventory_2_outlined),
              label: 'Bulk',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart),
                label: 'Cart')
          ]),
    );
  }

  Positioned adress_selection_button() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Appallete.gradient1),
              borderRadius: BorderRadius.circular(8)),
          height: 40,
          margin: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSlecetAdress = true;
                      isAddAdress = false;
                    });
                  },
                  child: Container(
                    height: 328,
                    decoration: BoxDecoration(
                        color: isSlecetAdress ? Appallete.gradient1 : null,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        'SELECT ADDRESS',
                        style: TextStyle(
                          color: isSlecetAdress ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    if (!isAddAdress) {
                      // If showing "Add ADDRESS", navigate to address widget
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const AddressWidget(),
                        ),
                      );
                      if (result == true) {
                        setState(() {
                          isAddAdress = true;
                          isSlecetAdress = false;
                        });
                      }
                    } else {
                      // await startPaytmTransaction();
                    }
                  },
                  child: Container(
                    height: 328,
                    decoration: BoxDecoration(
                        color: isAddAdress ? Appallete.gradient1 : null,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        isAddAdress ? 'Make Payment' : 'Add ADDRESS',
                        style: TextStyle(
                          color: isAddAdress ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column bill_details() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('BILL DETAILS',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        BillCard()
      ],
    );
  }

  Column offers_and_benefits(VoidCallback couponOnTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('OFFERS AND BENEFITS',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: couponOnTap,
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Appallete.borderColor)),
            title: const Text('Explore more coupons for you >'),
          ),
        ),
        Row(
          children: [
            Checkbox(
              activeColor: Colors.green,
              value: isTreeshouldPlant,
              onChanged: (value) {
                setState(() {
                  isTreeshouldPlant = value!;
                });
              },
            ),
            const Text(
              "🌳",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 5),
            const Text(
              'Tree Plantation',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
            const Icon(
              Icons.info,
              color: Colors.green,
            )
          ],
        )
      ],
    );
  }

  Column delivery_address(String text, VoidCallback maponPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.location_pin)),
            TextButton(
                onPressed: maponPressed,
                child: const Text(
                  'Edit',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ))
          ],
        ),
        Row(
          children: [
            const Text('Add instruction for delivery partner '),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.info,
                  size: 10,
                ))
          ],
        )
      ],
    );
  }

  Column select_deliver_slot() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        const Text(
          'SELECT DELIVERY SLOT',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isLunchSelected = !isLunchSelected;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  color: isLunchSelected ? Appallete.gradient1 : null,
                ),
                child: Column(
                  children: [
                    Text(
                      'Lunch',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isLunchSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    Divider(
                      color: isLunchSelected ? Colors.white : Colors.black,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.wb_sunny,
                          color: isLunchSelected ? Colors.yellow : Colors.black,
                        ),
                        Text(
                          '12:00 PM - 1:30 PM',
                          style: TextStyle(
                            color:
                                isLunchSelected ? Colors.white : Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isDinnerSelected = !isDinnerSelected;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                  color: isDinnerSelected ? Appallete.gradient1 : null,
                ),
                child: Column(
                  children: [
                    Text(
                      'Dinner',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDinnerSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    Divider(
                      color: isDinnerSelected ? Colors.white : Colors.black,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mode_night,
                          color: isDinnerSelected ? Colors.white : Colors.black,
                        ),
                        Text(
                          '12:00 PM - 1:30 PM',
                          style: TextStyle(
                            color:
                                isDinnerSelected ? Colors.white : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const CustomCalendarPicker()
      ],
    );
  }

  Row donot_cutlery(
    String text,
    VoidCallback donotsentonpressed,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 5,
      children: [
        Checkbox(
          activeColor: Colors.green,
          value: ischeckboxselected,
          onChanged: (value) {
            setState(() {
              ischeckboxselected = value!;
            });
          },
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        IconButton(
          onPressed: donotsentonpressed,
          icon: const Icon(
            Icons.info_outline,
            size: 16,
          ),
        )
      ],
    );
  }

  Row guildeline_charges_widget(
      String text, IconData icon, VoidCallback onpressed) {
    return Row(
      spacing: 2,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        IconButton(
          onPressed: onpressed,
          icon: const Icon(
            Icons.info_outline,
            size: 16,
          ),
        )
      ],
    );
  }

  Container special_instruction(String text) {
    return Container(
      width: 80,
      height: 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black)),
      child: Center(child: Text(text)),
    );
  }

  Card plan_card_widget() {
    return Card(
      // elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '7 Day Plan - Flexi',
                  maxLines: 3,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 25,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Appallete.whiteColor,
                            borderRadius: BorderRadius.circular(2)),
                        child: IconButton(
                            onPressed: decreamentQuantity,
                            icon: const Icon(
                              Icons.remove,
                              size: 12,
                              color: Appallete.gradient1,
                            )),
                      ),
                      Text(
                        '$quantity',
                        style: const TextStyle(
                            fontSize: 16, color: Appallete.whiteColor),
                      ),
                      Container(
                        height: 25,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Appallete.whiteColor,
                            borderRadius: BorderRadius.circular(2)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            size: 12,
                            color: Appallete.gradient1,
                          ),
                          onPressed: inCreamentQuantity,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Text(
                '3 Chapati/Roti,2 Veg Curry/Dry,1 Dal, 1 Steamed Rice, Cut Salad,Sweet'),
            Text(
              "₹${1749 * quantity} x $quantity",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Wouldyou like some add-ons?'),
                Icon(Icons.keyboard_arrow_down)
              ],
            )
          ],
        ),
      ),
    );
  }
}
