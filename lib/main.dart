import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase_app/providers/menu_item_provider.dart';
import 'package:showcase_app/routes/router.dart';

import 'package:showcase_app/utils/utils.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);
    return MaterialApp.router(
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.black)),
        colorScheme: const ColorScheme.light(
          background: clearWhite,
          primary: Colors.blueAccent,
          secondary: Colors.red,
        ),
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white)),
        colorScheme: const ColorScheme.dark(
          background: darkBackgroundColor,
          primary: Colors.blueAccent,
          secondary: Colors.red,
        ),
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
      // routerConfig: AppRouter.instance.router,
      routeInformationParser: AppRouter().router.routeInformationParser,
      routerDelegate: AppRouter().router.routerDelegate,
      routeInformationProvider: AppRouter().router.routeInformationProvider,
    );
  }
}
