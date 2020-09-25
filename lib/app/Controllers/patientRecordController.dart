import 'package:demo_speech_to_text/app/Data/patientsModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;

class PatientRecordController extends GetxController {
  stt.SpeechToText _speech; // Used For Speech to text
  var patientList = PatientList().obs;
  PatientList get getPatientList => this.patientList.value;
  set setPatientList(value) => this.patientList.value = value;

  final isListning = false.obs;
  final listenedText = "".obs;

  @override
  void onInit() {
    fetchPatientsRecords();
    _speech = stt.SpeechToText();
    super.onInit();
  }

  fetchPatientsRecords() async {
    var str = await rootBundle.loadString("assets/mockData.json");
    patientList.value = PatientList.fromRawJson(str);
  }

  ///Speech to Text Setup
  void listen() async {
    if (!isListning.value) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          if (val == "listening") {
            isListning.value = true;
            print(val);
          } else {
            isListning.value = false;
            _speech.stop();
            print(val);
          }
        },
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        isListning.value = true;
        _speech.listen(onResult: (val) {
          listenedText.value = val.recognizedWords;
        });
      }
    } else {
      isListning.value = false;
      _speech.stop();
    }
  }
}
