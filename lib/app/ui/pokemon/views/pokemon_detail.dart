import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luffy/app/widget/image.dart';

import '../controllers/pokemon_controller.dart';

class PokemonDetailView extends StatefulWidget {
  const PokemonDetailView({Key? key}) : super(key: key);

  @override
  State<PokemonDetailView> createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> {
  final controller = Get.find<PokemonController>();

  String id = Get.parameters['id'] ?? '25';
  String name = Get.parameters['name'] ?? '';

  @override
  void initState() {
    super.initState();
    controller.getPokemon(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text('${name} #${id}'),
      ),
      body: GetBuilder<PokemonController>(builder: (controller) {
        return controller.pokemon.id == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: <Widget>[
                  Positioned(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width - 20,
                    left: 10.0,
                    top: MediaQuery.of(context).size.height * 0.1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(height: 70.0),
                          Text(
                            controller.pokemon.name,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Height: ${controller.pokemon.height}'),
                          Text('Weight: ${controller.pokemon.weight}'),
                          Text(
                            'Types',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: controller.pokemon.types
                                .map((v) => FilterChip(
                                    backgroundColor: Colors.amber,
                                    label: Text(v.type.name),
                                    onSelected: (b) {}))
                                .toList(),
                          ),
                          Text('Abilities',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: controller.pokemon.abilities
                                .map((v) => FilterChip(
                                    backgroundColor: Colors.red,
                                    label: Text(
                                      v.ability.name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onSelected: (b) {}))
                                .toList(),
                          ),
                          Text('Stats',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: controller.pokemon.stats
                                .sublist(0, 3)
                                .map((n) => FilterChip(
                                      backgroundColor: Colors.green,
                                      label: Text(
                                        n.stat.name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onSelected: (b) {},
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: controller.pokemon.sprites.frontDefault,
                      child: cachedNetworkImage(
                        controller.pokemon.sprites.frontDefault,
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  )
                ],
              );
      }),
    );
  }
}
