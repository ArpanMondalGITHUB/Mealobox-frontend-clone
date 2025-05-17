import 'package:flutter/material.dart';
import 'package:mealoboxclone/global/theme/appalatte.dart';

class BillCard extends StatelessWidget {
  const BillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ClipPath(
        clipper: TicketWaveClipper(),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Appallete.whiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'To Pay',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Text(
                        '₹3931.9',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '₹3231.9',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Appallete.borderColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              _buildDottedLine(),
              _buildBillRow('Item Total', '₹3498'),
              _buildBillRow('Discount', '(-)₹560', isGreen: true),
              _buildBillRow('1 Chapati Extra', '₹168'),
              _buildBillRow('No Cutlery Discount', '(-)₹28'),
              _buildBillRow('Delivery Charges', 'FREE', originalPrice: '₹70'),
              _buildBillRow('Platform Charges', 'FREE', originalPrice: '₹14'),
              _buildBillRow('Applicable Taxes', '₹153.9'),
              const Divider(height: 32),
              _buildBillRow('TO PAY', '₹3231.9',
                  originalPrice: '₹3931', isBold: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBillRow(
    String label,
    String amount, {
    bool isGreen = false,
    bool isBold = false,
    String? originalPrice,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Row(
            spacing: 4,
            children: [
              if (originalPrice != null)
                Text(
                  originalPrice,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: isGreen ? Colors.green : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Dotted Line for Perforation Effect
Widget _buildDottedLine() {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          (constraints.maxWidth / 10).floor(),
          (index) => const SizedBox(
            width: 5,
            height: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          ),
        ),
      );
    },
  );
}

class TicketWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start at the top-left corner
    path.moveTo(0, 0);

    // Draw the top edge
    path.lineTo(size.width, 0);

    // Draw the right edge
    path.lineTo(size.width, size.height);

    // Draw the bottom wave pattern
    double waveWidth = 20.0; // Width of each wave
    double waveHeight = 10.0; // Height of each wave

    for (double x = size.width; x > 0; x -= waveWidth) {
      path.quadraticBezierTo(
        x - (waveWidth / 2), // Control point (center of the wave)
        size.height - waveHeight, // Height of the wave
        x - waveWidth, // End of the wave
        size.height, // Bottom of the container
      );
    }

    // Draw the left edge
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
