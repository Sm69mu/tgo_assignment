import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../apis/apis.dart';
import '../models/excercise_response_model.dart';

class ExerciseProvider extends ChangeNotifier {
  final ExerciseRepository _exerciseRepository = ExerciseRepository();
  final int _limit = 25;
  int _page = 1;
  bool _hasMore = true;
  List<Exercise> exercises = [];

  List<Exercise> addedExcercises = [];

  bool get hasMore => _hasMore;

  List<Exercise> addExercises(List<Exercise> exercisesToAdd) {
    addedExcercises.addAll(exercisesToAdd);
    notifyListeners();
    log("list added");
    return addedExcercises;
  }

  List<Exercise> removeExercises(List<Exercise> exercisesToRemove) {
    addedExcercises
        .removeWhere((exercise) => exercisesToRemove.contains(exercise));
    notifyListeners();
    log("list removed");
    return addedExcercises;
  }

  Future getExercisesList() async {
    if (!_hasMore) return;

    try {
      List<Exercise> response = await _exerciseRepository.getExercises(_page);

      if (response.length < _limit) {
        _hasMore = false;
      }
      exercises.addAll(response);
      _page++;
      log("calling api");
      notifyListeners();
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
  }

  Future<void> refresh() async {
    _page = 1;
    exercises = [];
    _hasMore = true;
    await getExercisesList();
    notifyListeners();
  }
}
