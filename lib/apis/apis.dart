import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/excercise_response_model.dart';

class ExerciseRepository {
  final String baseUrl =
      "https://app.trainergoesonline.com/workouts?owner_id=gWJ1Ha3TYXgh1o9YeWfsAWLkk6z2&query=bench&common=true&page=";

  Future<List<Exercise>> getExercises(int page) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl+$page'.toString()));
   

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        log(data.toString());
        return List<Exercise>.from(data.map((e) => Exercise.fromJson(e)));
      } else {
        throw Exception('Failed to load exercises: ${response.reasonPhrase}');
      }
    } on Exception catch (e) {
      log('Error: $e');
      throw Exception('Failed to load exercises: $e');
    }
  }
}
