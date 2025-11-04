// lib/screens/quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../config/app_router.dart';
import '../models/question_model.dart';
import '../providers/quiz_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/option_card.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan Consumer untuk 'mendengarkan' perubahan state
    return Consumer<QuizProvider>(
      builder: (context, provider, child) {
        // Jika kuis selesai, otomatis navigasi ke hasil
        if (provider.isQuizFinished) {
          // Kita gunakan addPostFrameCallback agar navigasi
          // terjadi setelah build selesai
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(AppRoutes.result);
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final Question currentQuestion = provider.currentQuestion;
        final int? selectedAnswer = provider.userAnswers[provider.currentQuestionIndex];

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Soal ${provider.currentQuestionIndex + 1}/${provider.questions.length}',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            // Progres bar linear
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: LinearProgressIndicator(
                value: provider.progressPercentage,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
            ),
          ),
          body: Padding(
            // Kriteria 6: Dynamic Padding
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 30),
                // Gunakan Expanded + ListView agar tidak overflow
                Expanded(
                  child: ListView.builder(
                    itemCount: currentQuestion.options.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        // Reusable Widget
                        child: OptionCard(
                          text: currentQuestion.options[index],
                          isSelected: selectedAnswer == index,
                          onTap: () {
                            provider.selectAnswer(provider.currentQuestionIndex, index);
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Reusable Widget
                CustomButton(
                  text: provider.currentQuestionIndex == provider.questions.length - 1
                      ? 'Selesai'
                      : 'Lanjut',
                  onPressed: () {
                    if (selectedAnswer == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pilih satu jawaban!')),
                      );
                    } else {
                      provider.nextQuestion();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}