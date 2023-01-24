import 'package:get/get.dart';

import '../../../dao/pokemon_dao.dart';
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

    final response = await PokemonDao.getPokemonList((page - 1) * limit, limit);

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
    pokemon = await PokemonDao.getPokemon(id);
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
