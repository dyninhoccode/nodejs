import 'package:flutter/material.dart';
import 'package:flutter_application_1/people.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TourListScreen extends StatelessWidget {
  final List<Tour> tours = [
    Tour('Da Nang - Ba Na - Hoi An', 'Jan 1st, 2020', 400.00, 3,
        'assets/images/da_nang_to_hoi_an_1.jpeg'),
    Tour('Melbourne - Sydney', 'Jan 3rd, 2020', 500.00, 6,
        'assets/images/dinh_doc_lap_1.jpeg'),
    Tour('Hanoi - Ha Long Bay', 'Jan 4th, 2020', 300.00, 3,
        'assets/images/hoian_1.jpeg'),
    Tour('Da Nang - Ba Na - Hoi An', 'Jan 5th, 2020', 400.00, 3,
        'assets/images/hoian_1.jpeg'),
    Tour('Melbourne - Sydney', 'Jan 6th, 2020', 500.00, 6,
        'assets/images/hoian_1.jpeg'),
    Tour('Hanoi - Ha Long Bay', 'Jan 7th, 2020', 300.00, 3,
        'assets/images/hoian_1.jpeg'),
  ];

  TourListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Quay lại màn hình trước đó
          },
        ),
        title: const Text(
          'Amazing Tours',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExploreScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.lightBlue,
              ),
              child: const Text('Next Scereen'),
            ),
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Hi, where do you want to explore?',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Tour list
            Expanded(
              child: ListView.builder(
                itemCount: tours.length,
                itemBuilder: (context, index) {
                  final tour = tours[index];
                  return TourCard(tour: tour);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tour {
  final String title;
  final String date;
  final double price;
  final int days;
  final String imagePath;

  Tour(this.title, this.date, this.price, this.days, this.imagePath);
}

class TourCard extends StatelessWidget {
  final Tour tour;

  const TourCard({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tour image with Stack
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      tour.imagePath,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Positioned rating stars in the bottom left of the image
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: RatingBarIndicator(
                      rating: 4.5,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tour info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tour.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Biểu tượng date và thời gian
                        Row(
                          children: [
                            const Icon(Icons.date_range,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 5),
                            Text(
                              tour.date,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 5),
                            Text(
                              '${tour.days} days',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Tour price và biểu tượng trái tim
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.favorite_border,
                            color: Colors.teal), // Trái tim
                        const SizedBox(height: 5),
                        Text(
                          '\$${tour.price.toStringAsFixed(2)}', // Giá tiền
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
