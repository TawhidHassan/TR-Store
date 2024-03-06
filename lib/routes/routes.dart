import 'package:TrStore/FeaturesModule/home/presentation/product_details_page.dart';
import 'package:TrStore/data/model/Product/Product.dart';
import 'package:TrStore/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../FeaturesModule/error/presentation/error_page.dart';
import '../../FeaturesModule/home/presentation/home_page.dart';
import '../FeaturesModule/cart/presentation/cart_page.dart';
import '../FeaturesModule/main_screen.dart';
import '../FeaturesModule/news/news_page.dart';




class AppRouter {

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');


  static final GoRouter routerx = GoRouter(
    initialLocation: Routes.mainPagePath,
    navigatorKey: Get.key,
    debugLogDiagnostics: true,
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
                routes:  [

                  GoRoute(
                    path: "news/:id/:path",
                    name: "news",
                    builder: (context, state) => NewsPage(
                      userId: state.pathParameters["id"].toString(),
                      path: state.pathParameters["path"].toString(),
                    ),
                  )

                ],
              ),
            ],
          ),
        ],
      ),


      GoRoute(
          name: Routes.CartPage,
          path: Routes.CartPagePath,
          pageBuilder: (context, state) =>  const NoTransitionPage(
            child: CartPage(),
          ),

      ),
      GoRoute(
        name: Routes.homePage,
        path: Routes.homePagePath,
        builder: (context, state) => const HomePage(),
      ),

      GoRoute(
        name: Routes.ProductDetailsPage,
        path: Routes.ProductDetailsPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: ProductDetailsPage(product: state.extra as Product),
        ),
      ),
      GoRoute(
        name: Routes.ErrorPage,
        path: Routes.ErrorPagePath,
        pageBuilder: (context, state) =>  NoTransitionPage(
          child: ErrorPage(),
        ),
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