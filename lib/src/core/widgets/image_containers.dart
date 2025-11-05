
import 'package:flutter/material.dart';
import './styles.dart';

class CircularImageContainer extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const CircularImageContainer({
    super.key,
    required this.imageUrl,
    this.radius = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: primaryColor,
          width: 4,
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
