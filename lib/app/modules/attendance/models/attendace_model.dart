class AttendaceModel{
    int? id;
    String studentName;
    String status;
    String date;


    AttendaceModel({
      this.id,
      required this.studentName,
      required this.status,
      required this.date
    });

    // convert obj to Maps
    Map<String, dynamic> toMap(){
      return {
          'id' : id,
          'studentname' : studentName,
          'status' : status,
          'date' : date,
      };
    }


    // converting map to obj
    factory AttendaceModel.fromMap(Map<String, dynamic> json){
      return AttendaceModel(
        id: json['id'],
        studentName: json['studentName'],
         status: json['status'],
          date: json['date'],
          );
    }
}