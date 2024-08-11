import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final double bottomBarHeight;

  // ignore: use_super_parameters
  const BottomNavigationWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.bottomBarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: bottomBarHeight,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            items: [
              _buildBottomNavigationBarItem(
                icon: Icons.home,
                label: 'Home',
                padding: const EdgeInsets.only(right: 8.0), 
              ),
              _buildBottomNavigationBarItem(
                icon: Icons.bar_chart,
                label: 'Stats',
                padding: const EdgeInsets.only(right: 20.0), 
              ),
              _buildBottomNavigationBarItem(
                icon: Icons.person,
                label: 'Profile',
                padding: const EdgeInsets.only(left: 20.0), 
              ),
              _buildBottomNavigationBarItem(
                icon: Icons.credit_card,
                label: 'Cards',
                padding: const EdgeInsets.only(left: 8.0), 
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
    required EdgeInsets padding,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24.0,),
            const SizedBox(height: 2), // Space between icon and label
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
      label: '',
    );
  }
}

