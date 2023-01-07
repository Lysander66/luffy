import 'package:get/get.dart';

import '../ui/screens.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.live,
      page: () => const LiveView(),
    ),
    GetPage(
      name: _Paths.pokemon,
      page: () => const PokemonView(),
      children: [
        GetPage(
          name: _Paths.pokemonDetail,
          page: () => const PokemonDetailView(),
        )
      ],
    ),
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileView(),
    ),
  ];
}
