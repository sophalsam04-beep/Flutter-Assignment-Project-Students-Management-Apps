import 'package:get/get.dart';


class HomeworkController extends GetxController{
    RxList<String> homeworkList = <String>[].obs;
    RxString title = "No Homework".obs;

    void addHomework(String homework) {
      homeworkList.add(homework);
      title.value = "You have ${homeworkList.length} homework(s)";
    }

    void clearHomework() {
      homeworkList.clear();
      title.value = "No Homework";
    }

    void removeHomework(int index) {
      if (index >= 0 && index < homeworkList.length) {
        homeworkList.removeAt(index);
        title.value = "You have ${homeworkList.length} homework(s)";
      }
    }

    void updateHomework(int index, String newHomework) {
      if (index >= 0 && index < homeworkList.length) {
        homeworkList[index] = newHomework;
      }
    }

    void markHomeworkAsDone(int index) {
      if (index >= 0 && index < homeworkList.length) {
        homeworkList[index] = "${homeworkList[index]} (Done)";
      }
    }
}