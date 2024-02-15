import 'package:TrStore/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../FeaturesModule/error/presentation/error_page.dart';
import '../../FeaturesModule/home/presentation/home_page.dart';
import '../FeaturesModule/cart/presentation/cart_page.dart';
import '../FeaturesModule/main_screen.dart';




// class AppRoutes {
//   static Route onGenerateRoutes(RouteSettings settings) {
//     final Map? args = settings.arguments as Map?;
//     switch (settings.name) {
//       case '/':
//         return _materialRoute(const SplashPage(key: ,));
//
//       case '/home':
//         return _materialRoute(HomePage());
//
//
//       default:
//         return _materialRoute(const HomePage());
//     }
//   }
//
//   static Route<dynamic> _materialRoute(Widget view) {
//     return MaterialPageRoute(builder: (_) => view);
//   }
// }


class AppRouter {

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
  static final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');


  static final GoRouter routerx = GoRouter(
    initialLocation: Routes.mainPagePath,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return MainScreen(
              navigationShell: navigationShell);
        },
        branches: [
          // first branch (A)
          StatefulShellBranch(
            initialLocation: Routes.mainPagePath,
            navigatorKey: _shellNavigatorAKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: Routes.mainPage,
                path: Routes.mainPagePath,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomePage(),
                ),
                routes: const [],
              ),
            ],
          ),
          // second branch (B)
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: Routes.CartPage,
                path: Routes.CartPagePath,
                pageBuilder: (context, state) =>  NoTransitionPage(
                  child: CartPage(),
                ),
                routes: [

                ]
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        name: Routes.homePage,
        path: Routes.homePagePath,
        builder: (context, state) => const HomePage(),
      ),




    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );

  static GoRouter get router => routerx;
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}