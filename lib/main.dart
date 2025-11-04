// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/app_router.dart';
import 'providers/quiz_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: MaterialApp.router(
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey.shade100,
          useMaterial3: true,
        ),
        // Menggunakan routerConfig dari go_router [cite: 1457, 1462]
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}