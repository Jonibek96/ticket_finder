import 'package:flutter/material.dart';
import 'package:ticket_finder/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ticket_finder/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicketFinder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      locale: const Locale('ru_RU'),
      supportedLocales: const [
        Locale('ru', 'RU'),
      ],
      home: const HomeScreen(),
    );
  }
}


