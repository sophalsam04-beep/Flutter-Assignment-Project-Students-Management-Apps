import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_apps/app/modules/attendance/models/attendace_model.dart';
import '/app/modules/attendance/views/attendance_report_screen.dart';

class AttendanceController extends GetxController{
      final TextEditingController nameController = TextEditingController();

      RxList<AttendaceModel> attendanceList = <AttendaceModel>[].obs;
      void addAttendance({
        required String statusName,
        required String status,
      }){
          if(statusName.isEmpty) return;


          attendanceList.add(
            AttendaceModel(
              studentName: statusName,
             status: status,
              date: DateTime.now().toString().substring(0,10),
              )
          );
      }

      

        int get totalPresent => attendanceList.where((e)=> e.status == "Present").length;
        int get totalAbsent => attendanceList.where((e)=> e.status == "Absent").length;

}     