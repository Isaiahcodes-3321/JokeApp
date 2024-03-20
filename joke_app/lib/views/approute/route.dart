import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joke_app/views/app_views/main_view/main_screen.dart';
import 'package:joke_app/views/app_views/splash_view/splash_view.dart';

class AppRoute{


  static String mainView = 'mainView';

static final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'mainView',
          name:  mainView,
          builder: (BuildContext context, GoRouterState state) {
            return const MainView();
          },
        ),
      ],
    ),
  ],
);
}