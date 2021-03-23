import 'package:firebase_flutter/app/models/pokemon_model.dart';
import 'package:firebase_flutter/app/modules/performance/performance_controller.dart';
import 'package:firebase_flutter/app/modules/performance/widgets/pokemon_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NetworkPerformancePage extends StatefulWidget {
  @override
  _NetworkPerformancePageState createState() => _NetworkPerformancePageState();
}

class _NetworkPerformancePageState
    extends ModularState<NetworkPerformancePage, PerformanceController> {
  final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((offset) {
      _fetchPage(offset);
    });
    super.initState();
  }

  Future<void> _fetchPage(int offset) async {
    try {
      final List<Pokemon> newItems = await controller.getPokemons();
      final bool isLastPage = newItems.length < controller.limitPerPage;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        controller.pageOffset += newItems.length;
        _pagingController.appendPage(newItems, controller.pageOffset);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokemons')),
      body: PagedListView<int, Pokemon>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) => PokemonItem(
            pokemon: item,
          ),
        ),
      ),
    );
  }
}
