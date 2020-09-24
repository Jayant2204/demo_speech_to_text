import 'package:demo_speech_to_text/app/Data/patientsModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PatientRecordController extends GetxController {
  var _patientList = PatientList().obs;
  PatientList get patientList => this._patientList.value;
  set patientList(value) => this._patientList.value = value;

  @override
  void onInit() async {
    var str = await rootBundle.loadString("assets/mockData.json");
    _patientList.value = PatientList.fromRawJson(str);
    super.onInit();
  }
}
