import 'package:bloc/bloc.dart';
import 'package:clinic_app/models/doctorModel.dart';
import 'package:clinic_app/modules/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<States> {
  AppCubit() : super(appInitStates());

  static AppCubit get(context) => BlocProvider.of(context);
  final store = FirebaseFirestore.instance;


  List<Doctor> specialization=[];
    Future<List<Doctor>> getDoctor() async {
      var doc = await store.collection('doctors').where('workAt', isEqualTo: 'tsiWH9GToShS4A2vFXLmkbgugj62').get();
      List<Doctor> Docts = [];
      //print(doc.docs.map((e) => e.get('firstName')));
      Docts = doc.docs.map((e) => Doctor.fromSnapshot(e)).toList();
      specialization=Docts;
     // print(Docts[1].specialization);
      return Docts;
    }

 List<Doctor> spec=[];
  Future<List<Doctor>> getSpecialization({required String value}) async {
    var doc = await store.collection('doctors').where('specialization', isEqualTo: "${value}").where('workAt', isEqualTo: 'tsiWH9GToShS4A2vFXLmkbgugj62').get();
    List<Doctor> Doct = [];
    //print(doc.docs.map((e) => e.get('firstName')));
    Doct = doc.docs.map((e) => Doctor.fromSnapshot(e)).toList();
     spec= Doct;
    return Doct;
  }

}