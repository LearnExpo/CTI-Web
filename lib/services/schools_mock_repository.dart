import 'package:career_transformation_institute/services/school_repository.dart';

import '../core/network/api_result.dart';
import '../models/school.dart';

/// Your original in-memory data, now satisfying the same interface as
/// the real API — lets you build/demo the whole app before the backend
/// exists, and gives you an offline fallback afterward.
class SchoolsMockRepository implements SchoolsRepository {
  static const List<School> _all = [
    // ...paste the exact list of School(...) entries from your
    // original SchoolsRepository here, unchanged...
  ];

  @override
  Future<ApiResult<List<School>>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 300)); // simulate latency
    return ApiSuccess(_all);
  }

  @override
  Future<ApiResult<School>> getById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final school = _all.where((s) => s.id == id).firstOrNull;
    if (school == null) {
      return const ApiFailure('School not found', statusCode: 404);
    }
    return ApiSuccess(school);
  }

  static List<String> get categories => ['All', ...{for (final s in _all) s.category}];
}