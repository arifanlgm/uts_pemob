// lib/data/dummy_questions.dart
import '../models/question_model.dart';

const List<Question> dummyQuestions = [
  Question(
    text: "Mata kuliah apakah yang sedang kita pelajari bersama ini?",
    options: ["Mobile Legends", "Pemrograman Mobile", "Flutter", "WhatsApp"],
    correctAnswerIndex: 1,
  ),
  Question(
    text: "Kapan jadwal Lab 5 Pemrograman Mobile dilaksanakan?",
    options: ["Jumat 14:40", "Selasa 08:00", "Rabu 08:00", "Kamis 10:30"],
    correctAnswerIndex: 2,
  ),
  Question(
    text: "Bahasa pemrograman apa yang digunakan oleh Flutter?",
    options: ["Dart", "C++", "HTML", "Python"],
    correctAnswerIndex: 0,
  ),
  Question(
    text: "Apa saja platform yang didukung oleh framework Flutter?",
    options: ["Android", "iOS", "Windows", "Semua benar"],
    correctAnswerIndex: 3,
  ),
  Question(
    text: "Apakah `StatelessWidget` dapat berubah state-nya secara internal?",
    options: ["Ya", "Tidak", "Mungkin", "Hanya dengan setState"],
    correctAnswerIndex: 0,
  ),
];