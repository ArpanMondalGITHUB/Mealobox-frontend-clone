import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';
import 'package:mealoboxclone/presentation/homepages/homescreen_widgets/animated_bottom_cart_sheet.dart';
import 'package:mealoboxclone/presentation/homepages/food_delivery_screen.dart';

class AnimatedCounterButton extends StatefulWidget {
  final Color color;
  final Function(int) onCountChanged;
  final int initialCount;
  final String price;
  const AnimatedCounterButton({
    super.key,
    required this.color,
    required this.onCountChanged,
    this.initialCount = 0,
    required this.price,
  });

  @override
  State<AnimatedCounterButton> createState() => _AnimatedCounterButtonState();
}

class _AnimatedCounterButtonState extends State<AnimatedCounterButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<Color?> _coloranimaton;
  // late Animation<double> _positionAnimation;
  PersistentBottomSheetController? _bottomSheetController;

  int _count = 0;
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _count = widget.initialCount;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _widthAnimation = Tween<double>(begin: 70, end: 100).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _coloranimaton = ColorTween(
            begin: Appallete.whiteColor, end: Appallete.gradient1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // _positionAnimation = Tween<double>(begin: 0, end: 1).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: Curves.easeOut,
    //   ),
    // );
  }

  void _toggleExpand() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _controller.forward();
        if (_count == 0) {
          _count = 1;
          widget.onCountChanged(_count);
          _showbottomsheet();
        }
      } else {
        _controller.reverse();
      }
    });
  }

  void _showbottomsheet() {
    // If bottom sheet is already showing, update it instead of creating new one
    if (_bottomSheetController != null) {
      _bottomSheetController!.setState!(() {
        // Update state if needed
      });
      return;
    }

    _bottomSheetController = Scaffold.of(context).showBottomSheet(
      (context) => AnimatedBottomCartSheet(
        itemcount: _count.toString(),
        subprice: widget.price,
        onViewCartTap: () {
          _bottomSheetController?.close();
          _bottomSheetController = null;
          // Add your cart navigation logic here
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => FoodDeliveryScreen()));
        },
      ),
      backgroundColor: Colors.transparent,
      enableDrag: true,
    );

    // Optional: Handle when bottom sheet is closed externally
    _bottomSheetController!.closed.then((value) {
      _bottomSheetController = null;
    });
  }

  void _updateBottomSheet() {
    if (_count > 0) {
      if (_bottomSheetController == null) {
        _showbottomsheet();
      } else {
        _bottomSheetController!.setState!(() {});
      }
    } else {
      _bottomSheetController?.close();
      _bottomSheetController = null;
    }
  }

  void _updateCount(bool increment) {
    setState(() {
      if (increment) {
        _count++;
      } else {
        if (_count > 1) {
          _count--;
        } else {
          _count = 0;
          _expanded = false;
          _controller.reverse();
        }
      }
      widget.onCountChanged(_count);
      _updateBottomSheet();
    });
  }

  @override
  void dispose() {
    _bottomSheetController?.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: _widthAnimation.value,
          // margin: EdgeInsets.only(right: _positionAnimation.value),
          height: 30,
          decoration: BoxDecoration(
              color: _coloranimaton.value,
              borderRadius: BorderRadius.circular(4)),
          child: _expanded
              ? Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 16,
                        ),
                        onPressed: () => _updateCount(false),
                      ),
                    ),
                    Text(
                      '$_count',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                        onPressed: () => _updateCount(true),
                      ),
                    ),
                  ],
                )
              : ElevatedButton(
                  onPressed: _toggleExpand,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _coloranimaton.value,
                    padding: EdgeInsets.zero,
                    //TODO did i have to give width and height or i can give it only in tween and that would be alright.//
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Appallete.gradient1,
                      fontSize: 16,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
