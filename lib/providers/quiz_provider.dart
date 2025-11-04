// lib/providers/quiz_provider.dart
import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../data/dummy_questions.dart';

class QuizProvider with ChangeNotifier {
  String _userName = "";
  final List<Question> _questions = dummyQuestions;
  final Map<int, int> _userAnswers = {}; // Menyimpan jawaban: <indexSoal, indexJawaban>
  int _currentQuestionIndex = 0;

  // Getters
  String get userName => _userName;
  List<Question> get questions => _questions;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  Map<int, int> get userAnswers => _userAnswers;
  int get currentQuestionIndex => _currentQuestionIndex;
  bool get isQuizFinished => _currentQuestionIndex >= _questions.length;
  double get progressPercentage => (isQuizFinished ? 1 : _currentQuestionIndex / _questions.length);

  // Setters
  void setUserName(String name) {
    _userName = name;
    notifyListeners(); // Memberi tahu UI untuk update
  }

  void selectAnswer(int questionIndex, int optionIndex) {
    _userAnswers[questionIndex] = optionIndex;
    notifyListeners(); // [cite: 171]
  }

  void nextQuestion() {
    if (!isQuizFinished) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  int calculateScore() {
    int correctAnswers = 0;
    _userAnswers.forEach((questionIndex, selectedOptionIndex) {
      if (_questions[questionIndex].correctAnswerIndex == selectedOptionIndex) {
        correctAnswers++;
      }
    });
    return correctAnswers;
  }

  void resetQuiz() {
    _userName = "";
    _userAnswers.clear();
    _currentQuestionIndex = 0;
    notifyListeners();
  }
}