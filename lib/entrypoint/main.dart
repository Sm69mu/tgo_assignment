import 'package:flutter/material.dart';
import 'package:tgo_assignment/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../providers/excercise_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ExerciseProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(255, 237, 128, 26),
      ),
      title: 'Flutter Demo',
      home: ChangeNotifierProvider(
        create: (context) => ExerciseProvider(),
        child: const HomeScreen(),
      ),
    );
  }
}
