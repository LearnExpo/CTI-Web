import 'package:career_transformation_institute/services/school_repository.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/network/api_result.dart';
import '../../../../models/school.dart';

enum LoadState { idle, loading, loaded, error }

/// Holds the async state for the Schools grid so the widget itself
/// stays declarative — it just listens and renders whatever state
/// this controller is in.
class SchoolsController extends ChangeNotifier {
  final SchoolsRepositoryNetwork _repository = getIt<SchoolsRepositoryNetwork>();

  LoadState state = LoadState.idle;
  List<School> schools = [];
  String? errorMessage;

  Future<void> load() async {
    state = LoadState.loading;
    notifyListeners();

    final result = await _repository.getAll();
    switch (result) {
      case ApiSuccess(:final data):
        schools = data;
        state = LoadState.loaded;
      case ApiFailure(:final message):
        errorMessage = message;
        state = LoadState.error;
    }
    notifyListeners();
  }
}