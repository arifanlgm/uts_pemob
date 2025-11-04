// lib/config/app_router.dart
import 'package:go_router/go_router.dart';
import '/screens/welcome_screen.dart';
import '/screens/quiz_screen.dart';
import '/screens/result_screen.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String quiz = '/quiz';
  static const String result = '/result';
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.welcome,
  routes: [
    GoRoute(
      path: AppRoutes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.quiz,
      builder: (context, state) => const QuizScreen(),
    ),
    GoRoute(
      path: AppRoutes.result,
      builder: (context, state) => const ResultScreen(),
    ),
  ],
);