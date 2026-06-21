import 'package:flutter/material.dart';
import 'grade_provider.dart';
import 'package:provider/provider.dart';

class GradeScreen extends StatelessWidget {
  const GradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GradeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grade Students",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: Column(
                    children: [
                      Text(
                        "Average students",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        provider.average.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Expanded(
                        child: ListView.builder(
                          itemCount: provider.grade.length,
                          itemBuilder: (context, index) {
                            final grade = provider.grades[index];

                            return Card(
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),

                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Text(
                                    grade.grade,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                title: Text(
                                  grade.subject,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                subtitle: Text("Score : ${grade.score}"),

                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.school,
                                    size: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Center(
                  child: Column(
                    children: [
                      Text(
                        "Checking the grade of Score",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
