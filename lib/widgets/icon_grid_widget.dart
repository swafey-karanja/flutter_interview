import 'package:flutter/material.dart';
// import '../utils/constants.dart';

// ignore: use_key_in_widget_constructors
class IconGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildIconWithLabel(Icons.send, 'Transfer', Colors.yellowAccent, size),
        buildIconWithLabel(Icons.attach_money, 'Withdraw', Colors.deepOrangeAccent, size),
        buildIconWithLabel(Icons.add_circle, 'Topup', Colors.pinkAccent, size),
        buildIconWithLabel(Icons.more_horiz, 'More', Colors.indigoAccent, size),
      ],
    );
  }
}

Widget buildIconWithLabel(IconData icon, String label, Color iconColor, Size size) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Circular container with dark background
      Container(
        padding: EdgeInsets.all(size.width * 0.03),
        decoration: BoxDecoration(
          color: const Color(0xDDDAD3D3), // Darker background within the circle
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xDDECE6E6), // Border color
            width: 2.0, // Border width
          ),
        ),
        child: Icon(icon, size: size.width * 0.07, color: iconColor),
      ),
      SizedBox(height: size.height * 0.01), // Space between the circle and the label
      Text(
        label,
        style: TextStyle(fontSize: size.width * 0.032, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    ],
  );
}