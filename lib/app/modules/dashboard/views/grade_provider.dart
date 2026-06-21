import 'package:flutter/material.dart';
import 'grade_model.dart';

class GradeProvider extends ChangeNotifier {
  final List<GradeModel> grades = [
    GradeModel(subject: "C++ Programing", score: 92, grade: "A"),

    GradeModel(subject: "Java Programing", score: 88, grade: "B"),

    GradeModel(subject: "C# Programing", score: 83, grade: "C"),

    GradeModel(subject: "PHP Programing", score: 75, grade: "D"),
    GradeModel(subject: "Web development", score: 65, grade: "E"),

    GradeModel(subject: "Mobile Apps developments", score: 57, grade: "F"),
  ];

  List<GradeModel> get grade => grades;

  // function have return type
  double get average {
    double total = 0;

    for (var item in grade) {
      total += item.score;
    }

    return total / grades.length;
  }

  void updateScore(double value) {
    double score = 0;

    score = value;

    notifyListeners();
  }
}
