import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_page.dart';

class SplashRouter {
  SplashRouter._();

  static final routers = <GetPage>[
    GetPage(name: '/', page: () => const SplashPage())
  ];
}
