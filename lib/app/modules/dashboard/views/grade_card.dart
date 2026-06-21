import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'grade_controller.dart';

class GradeCard extends StatelessWidget {
  const GradeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final GradeController controller = Get.put(GradeController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => Text(
                    controller.label.value,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 10),

                Obx(
                  () => Text(
                    controller.currentGrade.value,
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    controller.currentGrade.value;
                  },
                  label: Text("+"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradeController extends GetxController {
  var currentGrade = "A+".obs;
  var label = "Grade".obs;

  void updateGrade(String newGrade) {
    currentGrade.value = newGrade;
  }
}
