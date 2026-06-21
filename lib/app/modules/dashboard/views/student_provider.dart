import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'student.dart';

class StudentProvider with ChangeNotifier {
  List<Student> _students = [];

  List<Student> get students => _students;

  Future<void> loadStudents() async {
    _students = await DbHelper.instance.readAllStudents();
    notifyListeners();
  }

  Future<void> addStudent(Student student) async {
    await DbHelper.instance.createStudent(student);
    await loadStudents();
  }

  Future<void> updateStudent(Student student) async {
    await DbHelper.instance.updateStudent(student);
    await loadStudents();
  }

  Future<void> deleteStudent(int id) async {
    await DbHelper.instance.deleteStudent(id);
    await loadStudents();
  }
}
