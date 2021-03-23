import 'package:firebase_flutter/app/models/pokemon_model.dart';
import 'package:firebase_flutter/app/modules/performance/performance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PokemonItem extends StatefulWidget {
  final Pokemon pokemon;

  PokemonItem({this.pokemon});

  @override
  _PokemonItemState createState() => _PokemonItemState();
}

class _PokemonItemState
    extends ModularState<PokemonItem, PerformanceController> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.pokemon.name.toUpperCase(),
        style: TextStyle(fontSize: 22),
      ),
      // trailing: Image.network(''),
    );
  }
}
