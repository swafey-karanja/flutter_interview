import 'package:flutter/material.dart';
// import '../utils/constants.dart';

// ignore: use_key_in_widget_constructors
class IconGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildIconWithLabel(Icons.send, 'Transfer', Colors.yellowAccent),
        buildIconWithLabel(Icons.attach_money, 'Withdraw', Colors.deepOrangeAccent),
        buildIconWithLabel(Icons.add_circle, 'Topup', Colors.pinkAccent),
        buildIconWithLabel(Icons.more_horiz, 'More', Colors.indigoAccent),
      ],
    );
  }
}

Widget buildIconWithLabel(IconData icon, String label, Color iconColor) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Circular container with dark background
      Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color(0xDDDAD3D3), // Darker background within the circle
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xDDECE6E6), // Border color
            width: 2.0, // Border width
          ),
        ),
        child: Icon(icon, size: 28, color: iconColor),
      ),
      const SizedBox(height: 8.0), // Space between the circle and the label
      Text(
        label,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    ],
  );
}