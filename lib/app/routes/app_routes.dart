import '../app.dart';

sealed class AppRoutes {
  static final routes = {
    '/': (context) => const SplashPage(),
    '/login': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
  };
}
