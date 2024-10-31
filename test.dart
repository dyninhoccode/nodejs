import 'package:flutter/material.dart';
import 'package:flutter_application_1/setting_people.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Trips',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyTripsScreen(),
    );
  }
}

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Trips'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Next Trips',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.teal,
              ),
              child: const Text('View Tours'),
            ),
            Expanded(
              child: ListView(
                children: const [
                  TripCard(
                    title: 'Ho Guom Trip',
                    date: 'Feb 2, 2020',
                    time: '8:00 - 10:00',
                    location: 'Hanoi, Vietnam',
                    participant: 'Jonathan P',
                    imagePath:
                        'assets/images/beautiful_tropical_beach_sea_sand_with_coconut_palm_tree_blue_sky_white_cloud_7419074791.jpeg',
                  ),
                  TripCard(
                    title: 'Ho Chi Minh Mausoleum',
                    date: 'Feb 2, 2020',
                    time: '8:00 - 10:00',
                    location: 'Hanoi, Vietnam',
                    participant: 'Stephne',
                    imagePath:
                        'assets/images/travel_couple_with_japanese_covered_bridge_hoi_vietnam_450412791.jpeg',
                  ),
                  TripCard(
                    title: 'Duc Ba Church',
                    date: 'Feb 2, 2020',
                    time: '8:00 - 10:00',
                    location: 'Ho Chi Minh, Vietnam',
                    participant: 'Myung Dae',
                    imagePath:
                        'assets/images/cungvanhoathieunhi_danang_vntrip_12.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.trip_origin),
      //       label: 'My Trips',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Wish List',
      //     ),
      //   ],
      // ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String location;
  final String participant;
  final String imagePath;

  const TripCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.participant,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200, // Chiều cao của hình ảnh
                      width: double.infinity,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Location trên góc trái hình ảnh (bỏ nền đen)
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 5),
                        Text(date),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 16),
                        const SizedBox(width: 5),
                        Text(time),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.person, size: 16),
                        const SizedBox(width: 5),
                        Text('Participant: $participant'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Button Detail với icon
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.info, size: 16),
                          label: const Text('Detail'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.teal),
                            ),
                          ),
                        ),
                        // Button Chat với icon
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.chat, size: 16),
                          label: const Text('Chat'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.teal),
                            ),
                          ),
                        ),
                        // Button Start với icon
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.play_arrow, size: 16),
                          label: const Text('Start'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.teal),
                            ),
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
