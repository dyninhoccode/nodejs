import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_service.dart'; // Đảm bảo đường dẫn chính xác
import 'package:flutter_application_1/people.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TourListScreen extends StatefulWidget {
  const TourListScreen({Key? key}) : super(key: key);

  @override
  _TourListScreenState createState() => _TourListScreenState();
}

class _TourListScreenState extends State<TourListScreen> {
  late Future<List<Tour>> futureTours;

  @override
  void initState() {
    super.initState();
    futureTours = ApiService().fetchTours(); // Gọi API để lấy danh sách tour
  }

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
            Navigator.pop(context);
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
            const SizedBox(height: 20),
            // Tour list
            Expanded(
              child: FutureBuilder<List<Tour>>(
                future: futureTours,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No tours available.'));
                  }

                  final tours = snapshot.data!;
                  return ListView.builder(
                    itemCount: tours.length,
                    itemBuilder: (context, index) {
                      final tour = tours[index];
                      return TourCard(tour: tour);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TourCard extends StatelessWidget {
  final Tour tour;

  const TourCard({Key? key, required this.tour}) : super(key: key);

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
                    child: Image.network(
                      tour.image,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/default_image.jpeg', // Hình ảnh mặc định nếu có lỗi
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  // Positioned rating stars in the bottom left of the image
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: RatingBarIndicator(
                      rating:
                          4.5, // Giá trị đánh giá tạm thời, bạn có thể thay đổi
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
                          tour.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                'Roboto', // Đảm bảo font hỗ trợ tiếng Việt
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Date icon and time
                        Row(
                          children: [
                            const Icon(Icons.date_range,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 5),
                            Text(
                              tour.departureDate,
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
                              '${tour.durationDays} days',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Tour price and heart icon
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.favorite_border, color: Colors.teal),
                        const SizedBox(height: 5),
                        Text(
                          '\$${tour.price.toStringAsFixed(2)}',
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
