import 'package:dio/dio.dart';
import 'package:firebase_flutter/app/models/pokemon_model.dart';
import 'package:firebase_flutter/app/modules/performance/repositories/interfaces/base_performance_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'performance_repository.g.dart';

@Injectable()
class PerformanceRepository extends BasePerformanceRepository {
  Dio _dio;
  PerformanceRepository(this._dio);

  @override
  Future<List<Pokemon>> getPokemons(int offset, int limit) async {
    try {
      Response resp = await _dio.get('pokemon?offset=$offset&limit=$limit');

      return (resp.data['results'] as List)
          .map((p) => Pokemon.fromJson(p))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
