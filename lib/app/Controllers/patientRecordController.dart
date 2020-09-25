import 'package:demo_speech_to_text/app/Data/patientsModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PatientRecordController extends GetxController {
  var patientList = PatientList().obs;
  PatientList get getPatientList => this.patientList.value;
  set setPatientList(value) => this.patientList.value = value;

  @override
  void onInit() {
    fetchPatientsRecords();
    super.onInit();
  }

  fetchPatientsRecords() async {
    var str = await rootBundle.loadString("assets/mockData.json");
    patientList.value = PatientList.fromRawJson(str);
  }
}
