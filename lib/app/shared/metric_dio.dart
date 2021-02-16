import 'package:dio/dio.dart';

class MetricDio {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
    ),
  );
}
