class Student {
  final int? id;
  final String name;
  final String rollNumber;
  final String grade;

  Student({
    this.id,
    required this.name,
    required this.rollNumber,
    required this.grade,
  });

  // Convert a Student object into a Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'rollNumber': rollNumber, 'grade': grade};
  }

  // Convert a Map into a Student object
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      rollNumber: map['rollNumber'],
      grade: map['grade'],
    );
  }
}
