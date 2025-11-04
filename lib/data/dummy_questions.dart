// lib/data/dummy_questions.dart
import '../models/question_model.dart';

const List<Question> dummyQuestions = [
  Question(
    text: "Apa framework yang digunakan untuk membangun aplikasi Flutter?",
    options: ["React Native", "SwiftUI", "Flutter", "Kotlin Multiplatform"],
    correctAnswerIndex: 2,
  ),
  Question(
    text: "Manakah yang merupakan package state management di Flutter?",
    options: ["Provider", "Redux", "Bloc", "Semua benar"],
    correctAnswerIndex: 3,
  ),
  Question(
    text: "Widget apa yang digunakan untuk navigasi deklaratif di Modul 3?",
    options: ["Navigator.push", "go_router", "getx", "auto_route"],
    correctAnswerIndex: 1,
  ),
  Question(
    text: "Perintah untuk menyimpan state saat aplikasi ditutup (Modul 4) adalah...",
    options: ["setState", "ChangeNotifier", "SharedPreferences", "Provider.of"],
    correctAnswerIndex: 2,
  ),
  Question(
    text: "Apakah `StatelessWidget` dapat berubah state-nya secara internal?",
    options: ["Ya", "Tidak", "Mungkin", "Hanya dengan setState"],
    correctAnswerIndex: 1,
  ),
];