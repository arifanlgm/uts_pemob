// lib/screens/welcome_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../config/app_router.dart';
import '../providers/quiz_provider.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose(); // Wajib di-dispose [cite: 650]
    super.dispose();
  }

  void _startQuiz() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama tidak boleh kosong!')),
      );
      return;
    }
    // Set nama di provider dan navigasi
    context.read<QuizProvider>().setUserName(_nameController.text.trim());
    context.go(AppRoutes.quiz); // Navigasi pakai go_router [cite: 1277]
  }

  @override
  Widget build(BuildContext context) {
    // Kriteria 6: Dynamic Sizing
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // Kriteria 6
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '../assets/images/logi final.png'
              ),
              const SizedBox(height: 20),
              Text(
                'Selamat Datang di kuis_pemob!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'masukkan nama kamu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 30),
              // Kriteria 3: Reusable Widget
              CustomButton(
                text: 'Mulai Kuis',
                onPressed: _startQuiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}