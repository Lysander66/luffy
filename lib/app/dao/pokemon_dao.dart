import 'package:summer/request.dart';
import 'package:summer/summer.dart' as summer;

import '../common/constant/env.dart';
import '../model/v1/pokemon.dart';

class PokemonDao {
  PokemonDao._();

  static late summer.Client client;

  static const _hostProd = 'https://pokeapi.co';
  static const _hostDev = 'https://pokeapi.co';
  static const _pokemonList = '/api/v2/pokemon';
  static const _pokemon = '/api/v2/pokemon/{id}';

  static init(String? env) {
    client = summer.Client(
      baseURL: env == Environment.prod ? _hostProd : _hostDev,
    );
  }

  static Future<Response> getPokemonList(int offset, int limit) async {
    final response = await client
        .R()
        .setQueryParam('offset', offset.toString())
        .setQueryParam('limit', limit.toString())
        .get(_pokemonList);
    return response;
  }

  static Future<Pokemon> getPokemon(String id) async {
    final response = await client.R().setPathParam('id', id).get(_pokemon);
    return Pokemon.fromJson(response.data);
  }
}
