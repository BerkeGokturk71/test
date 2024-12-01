// service_learn.dart
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:tester/service/post_model.dart';

class Service {
  final Dio _dio;
  final String _baseUrl = "https://dorm-api.onrender.com/";

  Service()
      : _dio = Dio(BaseOptions(baseUrl: "https://dorm-api.onrender.com/"));

  Future<List<PostModel>?> fetchPostItems(
      String selectedDate, String selectedMeal) async {
    try {
      final response = await _dio.get("tasks/$selectedDate/$selectedMeal/");

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is List) {
          return data.map((e) => PostModel.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  String getCurrentMeal() {
    final currentHour = DateTime.now().hour;
    return (currentHour >= 12) ? "Aksam" : "Kahvaltı";
  }

  String getCurrentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }
}
