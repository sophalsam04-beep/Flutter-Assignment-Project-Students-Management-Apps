import 'package:flutter/material.dart';

class ClassworkCard extends StatelessWidget {
  final String title;
  final String image;

  const ClassworkCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 100, height: 100),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
