import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "http://localhost:3000/tours";

  Future<List<Tour>> fetchTours() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((tourJson) => Tour.fromJson(tourJson)).toList();
    } else {
      throw Exception("Failed to load tours");
    }
  }
}

class Tour {
  final String id;
  final String name;
  final String departureDate;
  final int durationDays;
  final double price;
  final String image;

  Tour({
    required this.id,
    required this.name,
    required this.departureDate,
    required this.durationDays,
    required this.price,
    required this.image,
  });

  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      id: json['id'],
      name: json['name'],
      departureDate: json['departure_date'],
      durationDays: json['duration_days'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }
}
