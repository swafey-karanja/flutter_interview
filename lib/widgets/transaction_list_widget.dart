import 'package:flutter/material.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSearchIcon(size),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.02),
                  child: _buildTransactionItem(
                    transactionName: 'Transaction 1',
                    name: 'Jack Reacher',
                    cardNumber: '**** **** **** 6583',
                    imagePath: 'images/jack_reacher.jpg',
                    size: size,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.02),
                  child: _buildTransactionItem(
                    transactionName: 'Transaction 2',
                    name: 'Uchiha Itachi',
                    cardNumber: '**** **** **** 4987',
                    imagePath: 'images/uchiha_itachi.jpg',
                    size: size,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.02),
                  child: _buildTransactionItem(
                    transactionName: 'Transaction 3',
                    name: 'Light Yagami',
                    cardNumber: '**** **** **** 5020',
                    imagePath: 'images/light_yagami.jpg',
                    size: size,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchIcon(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.005, right: size.width * 0.02),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Icon(
          Icons.search,
          color: Colors.blue,
          size: size.width * 0.09,
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required String transactionName,
    required String name,
    required String cardNumber,
    required String imagePath, // Changed from imageUrl to imagePath
    required Size size,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.01),
      padding: EdgeInsets.all(size.width * 0.03),
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
            width: size.width * 0.1,
            height: size.width * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagePath), // Use AssetImage here
              ),
            ),
          ),
          SizedBox(width: size.width * 0.03), // Space between photo and text
          // Name and card number
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: size.width * 0.034,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.005),
              Text(
                cardNumber,
                style: TextStyle(
                  fontSize: size.width * 0.032,
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
