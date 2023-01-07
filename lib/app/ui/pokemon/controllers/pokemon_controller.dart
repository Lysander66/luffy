import 'package:get/get.dart';

import '../../../dao/config.dart';
import '../../../dao/define.dart';
import '../../../model/v1/pokemon.dart';

class PokemonController extends GetxController {
  static const limit = 20;
  var page = 1;
  List<Pokemon> pokemonList = [];
  Pokemon pokemon = Pokemon();

  @override
  void onInit() {
    super.onInit();
    getPokemonList();
  }

  // https://pokeapi.co/api/v2/pokemon
  getPokemonList() async {
    pokemonList = []; //clear
    final offset = (page - 1) * limit;
    final response = await pokemonClient
        .R()
        .setQueryParam('offset', offset.toString())
        .setQueryParam('limit', limit.toString())
        .get(PokemonApi.pokemonList);

    for (var v in (response.data['results'] as List<dynamic>)) {
      final url = v['url'] as String;
      final name = v['name'] as String;
      var tmp = url.replaceAll('https://pokeapi.co/api/v2/pokemon/', '');
      var end = tmp.lastIndexOf('/');
      var idStr = tmp.substring(0, end);

      final item = Pokemon();
      item.id = int.parse(idStr);
      item.name = name;
      pokemonList.add(item);
    }
    update();
  }

  getPokemon(String id) async {
    final response =
        await pokemonClient.R().setPathParam('id', id).get(PokemonApi.pokemon);

    pokemon = Pokemon.fromJson(response.data);
    update();
  }

  getMore() async {
    page++;
    await getPokemonList();

    Get.snackbar('more', 'page: ${page}', duration: Duration(seconds: 2));
  }

  reset() async {
    page = 1;
    await getPokemonList();

    Get.snackbar('reset', 'page: ${page}', duration: Duration(seconds: 2));
  }
}
