import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';

class AnimatedBottomCartSheet extends StatefulWidget {
  final String itemcount;
  final String subprice;
  final VoidCallback onViewCartTap;
  const AnimatedBottomCartSheet(
      {super.key,
      required this.itemcount,
      required this.subprice,
      required this.onViewCartTap});

  @override
  State<AnimatedBottomCartSheet> createState() =>
      _AnimatedBottomCartSheetState();
}

class _AnimatedBottomCartSheetState extends State<AnimatedBottomCartSheet>
    with TickerProviderStateMixin {
  late AnimationController _bottomsheetcontroler;

  @override
  void initState() {
    super.initState();
    _bottomsheetcontroler = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bottomsheetcontroler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bottomsheetcontroler,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          height: 70,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              color: Appallete.gradient1,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side - Item count and price
              Row(
                spacing: 2,
                children: [
                  Text(
                    "${widget.itemcount}Item",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Appallete.whiteColor,
                    ),
                  ),
                  const Text(
                    '|',
                    style: TextStyle(
                      color: Appallete.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "₹${widget.subprice}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Appallete.whiteColor,
                    ),
                  ),
                ],
              ),

              // Right side - Cart icon and View Cart text
              InkWell(
                onTap: widget.onViewCartTap,
                child: const Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Appallete.whiteColor,
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'View Cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Appallete.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
