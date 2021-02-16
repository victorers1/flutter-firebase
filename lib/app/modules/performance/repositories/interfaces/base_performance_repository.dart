import 'package:firebase_flutter/app/models/pokemon_model.dart';

abstract class BasePerformanceRepository {
  Future<List<Pokemon>> getPokemons(int offset, int limit);
  // Future getPokemonPhoto(String url);
}
