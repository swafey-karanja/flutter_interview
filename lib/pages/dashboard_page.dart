import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/carousel_slider_widget.dart';
import '../widgets/icon_grid_widget.dart' as icon_grid;
import '../widgets/transaction_list_widget.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../utils/constants.dart';

// ignore: use_key_in_widget_constructors
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(),
      child: _DashboardContent(),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context);
    final double bottomBarHeight = MediaQuery.of(context).size.height * 0.12;

    return Scaffold(
        appBar: AppBar(
          title: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Evening,',
                style: TextStyle(
                  fontSize: 14, // Adjust the font size as needed
                  color: Colors.grey, // Adjust the color as needed
                ),
              ),
              Text(
                'King Crimson',
                style: AppStyles.appBarTitleStyle,
              ),
            ],
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Handle notifications tap
              },
            ),
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                // Handle history tap
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CarouselSliderWidget(),
                const SizedBox(height: 30),
                icon_grid.IconGridWidget(),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Send Again', style: AppStyles.sectionTitleStyle),
                ),
                const SizedBox(height: 20),
                TransactionListWidget(),
                const SizedBox(height: 10),
                // Various Buttons Section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space between elements
                    children: [
                      Text('Savings', style: AppStyles.sectionTitleStyle),
                      Text('Create new', style: AppStyles.linkStyles),
                    ],
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _buildIconWithContainer(Icons.local_offer, 'Offer', Colors.greenAccent),
                    _buildIconWithContainer(Icons.shopping_cart, 'Cart', Colors.blueAccent),
                    _buildIconWithContainer(Icons.receipt, 'Receipt', Colors.redAccent),
                    _buildIconWithContainer(Icons.account_balance_wallet, 'Wallet', Colors.cyanAccent),
                    _buildIconWithContainer(Icons.support_agent, 'Support', Colors.limeAccent),
                    _buildIconWithContainer(Icons.money, 'Bank', const Color(0xFF07D888)),
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 50.0,
          width: 50.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () => _showBottomSheet(context),
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationWidget(
          selectedIndex: provider.selectedIndex,
          onItemTapped: (index) => provider.updateSelectedIndex(index),
          bottomBarHeight: bottomBarHeight,
        ),
      );  }

  Widget _buildIconWithContainer(IconData icon, String label, Color iconColor) {
  return Container(
    padding: const EdgeInsets.all(14.0), // Padding inside the container
    margin: const EdgeInsets.all(8.0), // Margin between containers
    decoration: BoxDecoration(
      color: Colors.white, // Background color of the container
      borderRadius: BorderRadius.circular(12.0), // Border radius for rounded corners
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 4.0,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: SingleChildScrollView(
      child: icon_grid.buildIconWithLabel(icon, label, iconColor),
    ),
  );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows for dynamic height based on content
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('More Services', style: AppStyles.sectionTitleStyle)
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildIconWithContainer(Icons.mobile_friendly, 'Mobile', Colors.greenAccent),
                  _buildIconWithContainer(Icons.shopping_cart, 'Cart', Colors.blueAccent),
                  _buildIconWithContainer(Icons.scanner_outlined, 'Scan', Colors.redAccent),
                  _buildIconWithContainer(Icons.currency_exchange, 'Exchange', Colors.cyanAccent),
                  _buildIconWithContainer(Icons.wallet, 'Wallet', Colors.limeAccent),
                  _buildIconWithContainer(Icons.money, 'Bank', const Color(0xFF07D888)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}