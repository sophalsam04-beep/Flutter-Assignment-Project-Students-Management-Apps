import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student_provider.dart';
import 'student_form.dart';
import 'student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load student data when app starts
    Provider.of<StudentProvider>(context, listen: false).loadStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Management')),
      body: Consumer<StudentProvider>(
        builder: (context, provider, child) {
          if (provider.students.isEmpty) {
            return const Center(child: Text('No students found. Add some!'));
          }
          return ListView.builder(
            itemCount: provider.students.length,
            itemBuilder: (context, index) {
              final student = provider.students[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(student.name),
                  subtitle: Text(
                    'Roll: ${student.rollNumber} | Grade: ${student.grade}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StudentForm(student: student),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => provider.deleteStudent(student.id!),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const StudentForm()),
        ),
      ),
    );
  }
}
