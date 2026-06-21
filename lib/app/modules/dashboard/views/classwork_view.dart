import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'classwork_controller.dart';

class ClassworkView extends GetView<ClassworkController> {
  const ClassworkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Classwork"), centerTitle: true),
      body: Center(
        child: Obx(
          () => Container(
            width: 180,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://i.pinimg.com/736x/ca/26/3b/ca263b96368b1717a08f39ac005af6dd.jpg",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),

                const SizedBox(height: 10),

                Text(
                  controller.title.value,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
