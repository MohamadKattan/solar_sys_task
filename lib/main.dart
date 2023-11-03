import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_system_task/contrller/state_manger.dart';
import 'package:solar_system_task/views/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StateManger()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Solar system task',
        theme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: const HomePage());
  }
}
