import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';

class CustomSnackbar {
  static OverlayEntry? _overlayEntry;
  static void show({
    required String title,
    Duration duration = const Duration(seconds: 3),
    required String rupee,
    required String notrupee,
    required String content,
    required String img,
    required BuildContext context,
  }) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              removeSnackbar();
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              child: AnimatedContainer(
                duration: const Duration(seconds: 3),
                curve: Curves.bounceInOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Appallete.whiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                height: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Text(
                          notrupee,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey.shade400),
                        ),
                        Text(
                          rupee,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Appallete.gradient1),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            content,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: Image.asset(
                              img,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // Insert the overlay
    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(duration, () {
      removeSnackbar();
    });
  }

  static void removeSnackbar() {
    if (_overlayEntry != null && _overlayEntry!.mounted) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
