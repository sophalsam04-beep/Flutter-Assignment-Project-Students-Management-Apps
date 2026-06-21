import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'grade_card.dart';


class GradeCard extends GetxController{
      var currentGrade = "A+".obs;
      var label = "Grade".obs;


      void updateGrade(String newGrade){
          currentGrade.value = newGrade;

      }

      
}