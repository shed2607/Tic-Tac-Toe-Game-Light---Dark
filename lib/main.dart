import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/screens/main_screen.dart';
import 'package:tic_tac_toe_game/services/color_theme.dart';
import 'package:tic_tac_toe_game/services/theme_changing.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
          builder: (context, value, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: value.isDark ? DarkTheme.themeData : LightTheme.themeData,
              home: const MainScreen(),
              debugShowCheckedModeBanner: false,
            );
          },
        ));
  }
}
