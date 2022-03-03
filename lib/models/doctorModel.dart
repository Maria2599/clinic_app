import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  String? id;
  String firstName;
  String lastName;
  int nationalId;
  String degree;
  String specialization;
  String workAt;
  List workingHours;
  List workingDays;
  List permission;
  Doctor(
      {this.id,
        required this.firstName,
        required this.lastName,
        required this.nationalId,
        required this.specialization,
        required this.degree,
        required this.workAt,
        required this.workingHours,
        required this.workingDays,
        required this.permission});

  factory Doctor.fromSnapshot(QueryDocumentSnapshot snapshot) {
    return Doctor(
        id: snapshot.id,
        firstName: snapshot.get('firstName'),
        lastName: snapshot.get('lastName'),
        nationalId: snapshot.get('nationalId'),
        specialization: snapshot.get('specialization'),
        degree: snapshot.get('degree'),
        workAt: snapshot.get('workAt'),
        workingHours: snapshot.get('workingHours'),
        workingDays: snapshot.get('workingDays'),
        permission: snapshot.get('permission'));
  }
  Map<String,dynamic> toMap(){
    return {
      'firstName':firstName,
      'lastName':lastName,
      'nationalId':nationalId,
      'specialization':specialization,
      'degree':degree,
      'workAt':workAt,
      'workingHours':workingHours,
      'workingDays':workingDays,
      'permission':permission,
    };
  }
}
