import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/attendance_controller.dart';
import 'attendance_report_screen.dart';

class AttendanceScreen extends StatelessWidget {
  AttendanceScreen({super.key});

  final AttendanceController controller = Get.put(AttendanceController());

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter Student Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addAttendance(
                        statusName: nameController.text,
                        status: "Present",
                      );

                      nameController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("Present"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addAttendance(
                        statusName: nameController.text,
                        status: "Absent",
                      );

                      nameController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Absent"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.attendanceList.length,
                  itemBuilder: (context, index) {
                    final item = controller.attendanceList[index];

                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: item.status == "Present"
                              ? Colors.green
                              : Colors.red,
                          child: Text(item.studentName[0].toUpperCase()),
                        ),
                        title: Text(item.studentName),
                        subtitle: Text(item.date),

                        trailing: Text(
                          item.status,
                          style: TextStyle(
                            color: item.status == "Present"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const AttendanceReportScreen());
                },
                child: Text("View Report"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
