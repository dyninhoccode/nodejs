import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Phần thông tin người dùng với nút Edit Profile
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/images/da_nang_to_hoi_an_1.jpeg'), // Hình ảnh đại diện
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Duy Nen',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Guide',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Hành động khi nhấn Edit Profile
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text('EDIT PROFILE'),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Các mục trong phần cài đặt
            SwitchListTile(
              title: const Text('Notifications'),
              value: true,
              onChanged: (bool value) {
                // Hành động khi bật/tắt Notifications
              },
            ),
            buildSettingsOption(context, 'Languages', Icons.language),
            buildSettingsOption(context, 'Payment Info', Icons.payment),
            buildSettingsOption(context, 'Income Stats', Icons.bar_chart),
            buildSettingsOption(context, 'Privacy & Policies', Icons.lock),
            buildSettingsOption(context, 'Feedback', Icons.feedback),
            buildSettingsOption(context, 'Usage', Icons.book),
            const SizedBox(height: 20),
            // Nút Sign out
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign out'),
              onTap: () {
                // Hành động khi nhấn Sign out
              },
            ),
          ],
        ),
      ),
    );
  }

  // Hàm tạo các mục trong phần cài đặt
  Widget buildSettingsOption(
      BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Hành động khi nhấn vào một tùy chọn cài đặt
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SettingsScreen(),
  ));
}
