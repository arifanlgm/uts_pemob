// lib/screens/result_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../config/app_router.dart';
import '../providers/quiz_provider.dart';
import '../widgets/custom_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuizProvider>();
    final score = provider.calculateScore();
    final totalQuestions = provider.questions.length;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Kuis Selesai!',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Icon(Icons.emoji_events, color: Colors.amber, size: 100),
              const SizedBox(height: 20),
              Text(
                'Mantap, ${provider.userName}!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Skormu:',
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.black54),
              ),
              Text(
                '$score / $totalQuestions',
                style: GoogleFonts.poppins(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 40),
              // Kriteria 3: Reusable Widget
              CustomButton(
                text: 'Ulangi Kuis',
                onPressed: () {
                  // Reset state di provider dan kembali ke awal
                  context.read<QuizProvider>().resetQuiz();
                  context.go(AppRoutes.welcome);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}