abstract class PokemonApi {
  static const hostProd = 'https://pokeapi.co';
  static const hostDev = 'https://pokeapi.co';

  static const pokemonList = '/api/v2/pokemon';
  static const pokemon = '/api/v2/pokemon/{id}';
}

abstract class WeatherApi {
  static const hostProd = 'http://www.nmc.cn';
  static const hostDev = 'http://www.nmc.cn';

  static const weather = '/rest/weather';
}
