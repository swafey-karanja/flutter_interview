import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatefulWidget {
  final double height;

  const CarouselSliderWidget({super.key, required this.height});

  @override
  // ignore: library_private_types_in_public_api
  _CarouselSliderWidgetState createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider(
          items: [
            _buildCarouselItem('images/classic-card.png', size),
            _buildCarouselItem('images/platinum-card.png', size),
            _buildCarouselItem('images/infinite-card.webp', size),
          ],
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            height: widget.height,
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

  Widget _buildCarouselItem(String assetPath, Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.width * 0.04),
      child: Image.asset(
        assetPath,
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
