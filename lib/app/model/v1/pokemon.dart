import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable(explicitToJson: true)
class Pokemon {
  int id = 0;
  late String name;
  late int order;
  late int height;
  late int weight;
  late List<PokemonAbilities> abilities;
  @JsonKey(name: 'base_experience')
  late int baseExperience;
  @JsonKey(name: 'is_default')
  late bool isDefault;
  @JsonKey(name: 'location_area_encounters')
  late String locationAreaEncounters;
  late PokemonSprites sprites;
  late List<PokemonStats> stats;
  late List<PokemonTypes> types;

  Pokemon();

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  String icon() {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${id}.png';
  }
}

@JsonSerializable(explicitToJson: true)
class PokemonAbilities {
  late PokemonAbilitiesAbility ability;
  @JsonKey(name: 'is_hidden')
  late bool isHidden;
  late int slot;

  PokemonAbilities();

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilitiesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PokemonAbilitiesAbility {
  late String name;
  late String url;

  PokemonAbilitiesAbility();

  factory PokemonAbilitiesAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilitiesAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilitiesAbilityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PokemonSprites {
  @JsonKey(name: 'front_default')
  late String frontDefault;
  @JsonKey(name: 'back_default')
  late String backDefault;
  late PokemonSpritesOther other;

  PokemonSprites();

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PokemonSpritesOther {
  @JsonKey(name: 'dream_world')
  late PokemonSpritesOtherDreamWorld dreamWorld;
  late PokemonSpritesOtherHome home;

  PokemonSpritesOther();

  factory PokemonSpritesOther.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesOtherFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesOtherToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PokemonSpritesOtherDreamWorld {
  @JsonKey(name: 'front_default')
  late String frontDefault;

  PokemonSpritesOtherDreamWorld();

  factory PokemonSpritesOtherDreamWorld.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesOtherDreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesOtherDreamWorldToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PokemonSpritesOtherHome {
  @JsonKey(name: 'front_default')
  late String frontDefault;

  PokemonSpritesOtherHome();

  factory PokemonSpritesOtherHome.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesOtherHomeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesOtherHomeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PokemonStats {
  @JsonKey(name: 'base_stat')
  late int baseStat;
  late int effort;
  late PokemonStatsStat stat;

  PokemonStats();

  factory PokemonStats.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PokemonStatsStat {
  late String name;
  late String url;

  PokemonStatsStat();

  factory PokemonStatsStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatsStatFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatsStatToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PokemonTypes {
  late int slot;
  late PokemonTypesType type;

  PokemonTypes();

  factory PokemonTypes.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PokemonTypesType {
  late String name;
  late String url;

  PokemonTypesType();

  factory PokemonTypesType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypesTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypesTypeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
