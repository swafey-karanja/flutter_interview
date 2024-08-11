import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            _buildCarouselItem('https://www.visa.co.in/dam/VCOM/regional/ap/india/global-elements/images/in-visa-classic-card-498x280.png'),
            _buildCarouselItem('https://www.visa.co.in/dam/VCOM/regional/ap/india/global-elements/images/in-visa-platinum-card-498x280.png'),
            _buildCarouselItem('https://www.visa.co.in/dam/VCOM/regional/ap/india/global-elements/images/in-visa-infinite-card-498x280.png'),
          ],
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            height: MediaQuery.of(context).size.height * 0.25,
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildCarouselItem(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [0, 1, 2].map((index) {
        return Container(
          width: _currentIndex == index ? 12.0 : 8.0,
          height: _currentIndex == index ? 8.0 : 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: _currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
            borderRadius: _currentIndex == index ? BorderRadius.circular(4.0) : null,
            color: _currentIndex == index ? Colors.blue : Colors.grey,
          ),
        );
      }).toList(),
    );
  }
}
