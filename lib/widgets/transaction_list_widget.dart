import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TransactionListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSearchIcon(),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0), // Add right margin
                    child: _buildTransactionItem(
                      transactionName: 'Transaction 1',
                      name: 'Jack Reacher',
                      cardNumber: '**** **** **** 6583',
                      imageUrl: 'https://images.unsplash.com/photo-1521566652839-697aa473761a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0), // Add right margin
                    child: _buildTransactionItem(
                      transactionName: 'Transaction 1',
                      name: 'Uchiha Itachi',
                      cardNumber: '**** **** **** 4987',
                      imageUrl: 'https://images.unsplash.com/photo-1541911087797-f89237bd95d0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTA3fHxwZXJzb258ZW58MHx8MHx8fDA%3D',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0), // Add right margin
                    child: _buildTransactionItem(
                      transactionName: 'Transaction 1',
                      name: 'Light Yagami',
                      cardNumber: '**** **** **** 5020',
                      imageUrl: 'https://plus.unsplash.com/premium_photo-1689551670902-19b441a6afde?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTIxfHxwZXJzb258ZW58MHx8MHx8fDA%3D',
                    ),
                  ),
                ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchIcon() {
    return Padding(
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
    );
  }

  Widget _buildTransactionItem({ 
    required String transactionName, 
    required String name, 
    required String cardNumber,
    required String imageUrl,
   }) {
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
      child: Row(
        children: [
          // Profile photo circle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl), // Replace with actual image URL
              ),
            ),
          ),
          const SizedBox(width: 12), // Space between photo and text
          // Name and card number
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name, // Replace with actual name
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4), // Space between name and card number
              Text(
                cardNumber, // Replace with actual card number
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}