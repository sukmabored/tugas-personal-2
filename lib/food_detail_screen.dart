import 'package:flutter/material.dart';

class FoodDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String price;

  FoodDetailScreen({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              image,
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Harga: $price',
              style: TextStyle(fontSize: 20, color: Colors.greenAccent),
            ),
          ],
        ),
      ),
    );
  }
}
