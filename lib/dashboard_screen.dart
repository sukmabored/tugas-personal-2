import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      'name': 'Pizza',
      'image': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Burger',
      'image': 'https://images.unsplash.com/photo-1508737027454-e6454ef45afd?q=80&w=2848&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Pasta',
      'image': 'https://plus.unsplash.com/premium_photo-1677000666741-17c3c57139a2?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Salad',
      'image': 'https://plus.unsplash.com/premium_photo-1673590981774-d9f534e0c617?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Sushi',
      'image': 'https://plus.unsplash.com/premium_photo-1668143358351-b20146dbcc02?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Makan Apa Minggu Ini?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Makanan selalu dibuat fresh',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FoodDetailScreen(
                            name: foodItems[index]['name']!,
                            image: foodItems[index]['image']!,
                            description: 'Deskripsi tentang ${foodItems[index]['name']}.',
                            price: '\$${(index + 1) * 5}', // Contoh harga
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            foodItems[index]['image']!,
                            fit: BoxFit.cover,
                            height: 100,
                            width: double.infinity,
                          ),
                          SizedBox(height: 8),
                          Text(
                            foodItems[index]['name']!,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}
