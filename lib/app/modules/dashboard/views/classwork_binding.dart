import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'classwork_controller.dart';

class ClassworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassworkController>(() => ClassworkController());
  }
}
