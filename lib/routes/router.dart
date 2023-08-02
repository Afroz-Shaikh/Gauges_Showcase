import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showcase_app/homescreen.dart';
import 'package:showcase_app/routes/route_names.dart';
import '../dashboard.dart';
import '../providers/menu_item_provider.dart';

class AppRouter {
  AppRouter._();
  static AppRouter instance = AppRouter._();
  factory AppRouter() => instance;
  GoRouter router = GoRouter(routes: [
    GoRoute(
        name: RouteConstansts.afroz,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomeScreen());
        }),
    GoRoute(
        name: RouteConstansts.linear,
        path: '/linear',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: DashBoard(
              playground: Playground.linear,
            ),
          );
        }),
    GoRoute(
        name: RouteConstansts.radial,
        path: '/radial',
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: DashBoard(
              playground: Playground.radial,
            ),
          );
        }),
    // GoRoute(
    //     name: RouteConstansts.radial,
    //     path: '/afroz',
    //     pageBuilder: (context, state) {
    //       return const MaterialPage(child: Center(child: Text("AFROZ")));
    //     })
  ]);
}
