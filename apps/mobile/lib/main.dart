import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/perks/presentation/perks_screen.dart';

void main() {
  runApp(const Be4TravelApp());
}

class Be4TravelApp extends StatelessWidget {
  const Be4TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Be4Travel',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const PerksScreen(),
    );
  }
}
