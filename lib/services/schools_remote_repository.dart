import 'package:career_transformation_institute/services/school_repository.dart';

import '../core/network/api_client.dart';
import '../core/network/api_endpoints.dart';
import '../core/network/api_exception.dart';
import '../core/network/api_result.dart';
import '../models/school.dart';

class SchoolsRemoteRepository implements SchoolsRepository {
  final ApiClient _client;

  SchoolsRemoteRepository(this._client);

  @override
  Future<ApiResult<List<School>>> getAll() async {
    try {
      final response = await _client.get(ApiEndpoints.schools);
      final list = (response.data as List)
          .map((json) => School.fromJson(json as Map<String, dynamic>))
          .toList();
      return ApiSuccess(list);
    } on ApiException catch (e) {
      return ApiFailure(e.message, statusCode: e.statusCode);
    }
  }

  @override
  Future<ApiResult<School>> getById(String id) async {
    try {
      final response = await _client.get(ApiEndpoints.schoolById(id));
      return ApiSuccess(School.fromJson(response.data as Map<String, dynamic>));
    } on ApiException catch (e) {
      return ApiFailure(e.message, statusCode: e.statusCode);
    }
  }
}