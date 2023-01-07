import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/v1/pokemon.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/image.dart';
import '../controllers/pokemon_controller.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({Key? key}) : super(key: key);

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  final controller = Get.find<PokemonController>();
  final _scrollController = ScrollController();
  bool isLoading = false;

  getMore() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    await controller.getMore();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var dist = _scrollController.position.maxScrollExtent -
          _scrollController.position.pixels;
      if (!isLoading &&
          dist < 5 &&
          _scrollController.position.maxScrollExtent != 0) {
        getMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon'),
        backgroundColor: Colors.cyan,
      ),
      body: GetBuilder<PokemonController>(builder: (controller) {
        return controller.pokemonList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  await controller.reset();
                },
                child: GridView.count(
                    controller: _scrollController,
                    crossAxisCount: 2,
                    children: controller.pokemonList
                        .map(
                          (v) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(
                                    '${Routes.pokemon}${Routes.pokemonDetail}?id=${v.id}&name=${v.name}');
                              },
                              child: _card(v),
                            ),
                          ),
                        )
                        .toList()),
              );
      }),
    );
  }

  _card(Pokemon item) => Hero(
        tag: item.icon(),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              cachedNetworkImage(item.icon()),
              Text(
                item.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
}
