import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student.dart';
import 'student_provider.dart';

class StudentForm extends StatefulWidget {
  final Student?
  student; // If null, we are adding; if provided, we are editing.

  const StudentForm({super.key, this.student});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _rollNumber;
  late String _grade;

  @override
  void initState() {
    super.initState();
    _name = widget.student?.name ?? '';
    _rollNumber = widget.student?.rollNumber ?? '';
    _grade = widget.student?.grade ?? '';
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final provider = Provider.of<StudentProvider>(context, listen: false);

      if (widget.student == null) {
        provider.addStudent(
          Student(name: _name, rollNumber: _rollNumber, grade: _grade),
        );
      } else {
        provider.updateStudent(
          Student(
            id: widget.student!.id,
            name: _name,
            rollNumber: _rollNumber,
            grade: _grade,
          ),
        );
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Add Student' : 'Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (val) => val!.isEmpty ? 'Enter a name' : null,
                onSaved: (val) => _name = val!,
              ),
              TextFormField(
                initialValue: _rollNumber,
                decoration: const InputDecoration(labelText: 'Roll Number'),
                validator: (val) => val!.isEmpty ? 'Enter roll number' : null,
                onSaved: (val) => _rollNumber = val!,
              ),
              TextFormField(
                initialValue: _grade,
                decoration: const InputDecoration(labelText: 'Grade'),
                validator: (val) => val!.isEmpty ? 'Enter grade' : null,
                onSaved: (val) => _grade = val!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text(widget.student == null ? 'Submit' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
