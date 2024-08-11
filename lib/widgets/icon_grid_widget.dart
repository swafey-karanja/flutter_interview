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
    return SizedBox(
      width: size.width * 0.2, 
      height: size.height * 0.1, 
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.12, 
            height: size.width * 0.12, 
            decoration: BoxDecoration(
              color: const Color(0xDDDAD3D3),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xDDECE6E6),
                width: 2.0,
              ),
            ),
            child: Center(
              child: Icon(icon, size: size.width * 0.06, color: iconColor),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            label,
            style: TextStyle(
              fontSize: size.width * 0.028,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
