import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers//dashboard_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double bottomBarHeight = MediaQuery.of(context).size.height * 0.1; // 10% of the screen height
    
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(),
      child: Scaffold(
        appBar: AppBar(
          
          title: const Text(
            'King Crimson',
            style: TextStyle(
              fontSize: 25, 
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
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
                // Image Carousel Slider
                CarouselSlider(
                  items: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0), // Rounded corners
                      child: Image.network(
                        'https://via.placeholder.com/600x200.png?text=Image+1',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0), // Rounded corners
                      child: Image.network(
                        'https://via.placeholder.com/600x200.png?text=Image+2',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0), // Rounded corners
                      child: Image.network(
                        'https://via.placeholder.com/600x200.png?text=Image+3',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    aspectRatio: 16 / 9, // Adjust aspect ratio if needed
                    height: MediaQuery.of(context).size.height * 0.25,
                    autoPlay: false,
                    enlargeCenterPage: true,
                  ),
                ),

                const SizedBox(height: 35),

                // Icons for Transfer, Withdraw, Topup, and More
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconWithLabel(Icons.send, 'Transfer', Colors.yellowAccent),
                    _buildIconWithLabel(Icons.attach_money, 'Withdraw', Colors.deepOrangeAccent),
                    _buildIconWithLabel(Icons.add_circle, 'Topup', Colors.pinkAccent),
                    _buildIconWithLabel(Icons.more_horiz, 'More', Colors.indigoAccent),
                  ],
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Send Again',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Completed Transactions Section
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, right: 8.0), // Add top and right margin
                      child: Container(
                        padding: const EdgeInsets.all(8.0), // Padding inside the container
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Gray background color
                          shape: BoxShape.circle, // Circular shape
                          border: Border.all(
                            color: Colors.transparent, // No visible border color
                            width: 2.0, // Border width
                          ),
                        ),
                        child: const Icon(
                          Icons.search, 
                          color: Colors.blue, 
                          size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded( // Wrap the SingleChildScrollView in an Expanded widget
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0), // Add right margin
                              child: _buildTransactionItem("Transaction 1"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0), // Add right margin
                              child: _buildTransactionItem("Transaction 2"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0), // Add right margin
                              child: _buildTransactionItem("Transaction 3"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                ),

                const SizedBox(height: 35),

                // Various Buttons Section
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
        bottomNavigationBar: SafeArea(
          child: SizedBox(
            height: bottomBarHeight,
            child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10.0,
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 30),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart, size: 30),
                    label: 'Stats',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle, size: 30),
                    label: 'My Profile',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.credit_card, size: 30),
                    label: 'My Cards',
                  ),
                ],
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

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
        child: _buildIconWithLabel(icon, label, iconColor),
      ),
    );
  }


// Function to Build Icons with Labels
  Widget _buildIconWithLabel(IconData icon, String label, Color iconColor) {
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
          child: Icon(icon, size: 35, color: iconColor),
        ),
        const SizedBox(height: 8.0), // Space between the circle and the label
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }


  // Function to Build a Transaction Item
  Widget _buildTransactionItem(String transactionName) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        transactionName,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<DashboardProvider>().updateSelectedItem('Home');
                  Navigator.pop(context);
                },
                child: const Text('Home'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<DashboardProvider>().updateSelectedItem('Settings');
                  Navigator.pop(context);
                },
                child: const Text('Settings'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<DashboardProvider>().updateSelectedItem('Profile');
                  Navigator.pop(context);
                },
                child: const Text('Profile'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<DashboardProvider>().updateSelectedItem('Messages');
                  Navigator.pop(context);
                },
                child: const Text('Messages'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<DashboardProvider>().updateSelectedItem('Notifications');
                  Navigator.pop(context);
                },
                child: const Text('Notifications'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<DashboardProvider>().updateSelectedItem('Logout');
                  Navigator.pop(context);
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        );
      },
    );
  }
}
