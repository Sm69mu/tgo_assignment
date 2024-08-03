import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../apis/apis.dart';
import '../models/excercise_response_model.dart';

class ExerciseProvider extends ChangeNotifier {
  final ExerciseRepository exerciseRepository = ExerciseRepository();
  bool isloading = false;
  List<Exercise> addedExcercises = [];
  int page = 1;

  List<Exercise> exercises = [];

  adExcersices(List<Exercise> excercisess) {
    addedExcercises.addAll(excercisess);
    log("excercise added");
    log(addedExcercises.toString());
    notifyListeners();
  }

  removeExcersise(List<Exercise> excercisess) {
    addedExcercises.remove(excercisess);
    log("excercsie removed");
    notifyListeners();
  }

  Future<void> getExercisesList() async {
    try {
      isloading = true;
      final newExercises = await exerciseRepository.getExercises(page);
      exercises.addAll(newExercises);
      isloading = false;
      page++;
      notifyListeners();
    } on Exception catch (e) {
      log("Error fetching exercises: $e");
    }
  }

  Future<void> refresh() async {
    addedExcercises.clear();
    page = 1;
    await getExercisesList();
  }
}
