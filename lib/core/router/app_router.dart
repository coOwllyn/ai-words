import 'package:flutter_words/core/services/injection_container.dart';
import 'package:flutter_words/presentation/screens/home_screen/cards_bloc/cards_bloc.dart';
import 'package:flutter_words/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter_words/presentation/screens/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const _initialLocation = '/';
  static const _splashScreen = '/';
  static const _homeScreen = '/home';
  //{consts end}

  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;

  static String get splashScreen => _splashScreen;
  static String get homeScreen => _homeScreen;
  //{getters end}

  AppRouter._privateConstructor() {
    _initialize();
  }

  factory AppRouter.init() {
    return _instance;
  }

  void _initialize({String initialLocation = _initialLocation}) {
    router = GoRouter(
      initialLocation: initialLocation,
      routes: <GoRoute>[
        GoRoute(
          path: _splashScreen,
          name: 'SplashScreen',
          builder: (context, state) => const SplashScreen(),
        ),

        GoRoute(
          path: _homeScreen,
          name: 'HomeScreen',
          builder: (context, state) => BlocProvider(
            create: (context) => sl<CardsBloc>()..add(const LoadCardsEvent()),
            child: const HomeScreen(),
          ),
        ),
        //{routes end}
      ],
    );
  }
}
