import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/attendance_controller.dart';

class AttendanceReportScreen extends StatelessWidget {
  const AttendanceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AttendanceController controller = Get.find<AttendanceController>();

    return Scaffold(
      appBar: AppBar(title: Text("Attendance Report")),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Obx(
          () => Column(
            children: [
              Card(
                color: Colors.green.shade100,
                child: ListTile(
                  title: const Text(
                    "total Present",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    controller.totalPresent.toString(),
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),

              const SizedBox(height: 11),
              Card(
                color: Colors.red.shade100,
                child: ListTile(
                  title: Text(
                    "Total Absent",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    controller.totalAbsent.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.attendanceList.length,
                  itemBuilder: (context, index) {
                    final item = controller.attendanceList[index];
                    return Card(
                      child: ListTile(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
