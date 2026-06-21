import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homework_controller.dart';

class HomeworkView extends StatelessWidget {
  HomeworkView({super.key});

  final HomeworkController controller = Get.put(HomeworkController());

  final TextEditingController homeworkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: homeworkController,
              decoration: InputDecoration(
                hintText: "Enter Homework",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                controller.addHomework(homeworkController.text);
                homeworkController.clear();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text("Add Homework"),
            ),

            const SizedBox(height: 20),

            Obx(() => Text(controller.title.value)),

            const SizedBox(height: 10),

            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: controller.homeworkList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.homeworkList[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.removeHomework(index),
                      ),
                      onTap: () => controller.markHomeworkAsDone(index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
