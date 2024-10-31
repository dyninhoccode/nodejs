import 'package:flutter/material.dart';
import 'package:flutter_application_1/test.dart';

class ExploreScreen extends StatelessWidget {
  final List<Guide> guides = [
    Guide('Yoo Jin', 'Korea', 'Jan 30, 2020', 'Danang, Vietnam',
        'assets/images/rectangle_325.png'),
    Guide('Jon Mark', 'Spain', 'Jan 30, 2020', 'Danang, Vietnam',
        'assets/images/rectangle_324.png'),
    Guide('Lynd Nguyen', 'US', 'Jan 30, 2020', 'Danang, Vietnam',
        'assets/images/photo_1513097633097329_a_3_a_64_e_0_d_41.jpeg'),
    Guide('Patrick', 'Italy', 'Jan 30, 2020', 'Danang, Vietnam',
        'assets/images/image_12.png'),
  ];

  ExploreScreen({super.key});

// import 'package:flutter/material.dart';

// class ExploreScreen extends StatelessWidget {
//   final List<Guide> guides = [
//     Guide('Yoo Jin', 'Korea', 'Jan 30, 2020', 'Danang, Vietnam',
//         'assets/yoojin.jpg'),
//     Guide('Jon Mark', 'Spain', 'Jan 30, 2020', 'Danang, Vietnam',
//         'assets/jonmark.jpg'),
//     Guide('Lynd Nguyen', 'US', 'Jan 30, 2020', 'Danang, Vietnam',
//         'assets/lyndnguyen.jpg'),
//     Guide('Patrick', 'Italy', 'Jan 30, 2020', 'Danang, Vietnam',
//         'assets/patrick.jpg'),
//   ];

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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Da Nang',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '26°C', // Giả lập nhiệt độ
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Hi, where do you want to guide?',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyTripsScreen(),
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
            // Title and See More
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Finding a Guide',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'SEE MORE',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Guide list
            Expanded(
              child: ListView.builder(
                itemCount: guides.length,
                itemBuilder: (context, index) {
                  final guide = guides[index];
                  return GuideCard(guide: guide);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Guide {
  final String name;
  final String country;
  final String date;
  final String location;
  final String imagePath;

  Guide(this.name, this.country, this.date, this.location, this.imagePath);
}

class GuideCard extends StatelessWidget {
  final Guide guide;

  const GuideCard({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Guide Image - chiếm 50% chiều ngang
            Expanded(
              flex: 5, // Điều chỉnh để chiếm 50% chiều ngang
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  guide.imagePath,
                  height: 150, // Tăng chiều cao để hiển thị tốt hơn
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
                width: 10), // Khoảng cách giữa hình và phần thông tin
            // Guide Information - chiếm 50% còn lại của chiều ngang
            Expanded(
              flex: 5, // Điều chỉnh để chiếm 50% chiều ngang
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    guide.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'from ${guide.country}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        guide.date,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        guide.location,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
