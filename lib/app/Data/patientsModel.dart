// To parse this JSON data, do
//
//     final patients = patientsFromJson(jsonString);

import 'dart:convert';

class PatientList {
  PatientList({this.patientData});

  List<Patients> patientData;

  factory PatientList.fromRawJson(String str) =>
      PatientList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PatientList.fromJson(Map<String, dynamic> json) => PatientList(
        patientData:
            List<Patients>.from(json["data"].map((x) => Patients.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(patientData.map((x) => x.toJson())),
      };
}

class Patients {
  Patients({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.latitude,
    this.longitude,
    this.description,
    this.image,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final Gender gender;
  final double latitude;
  final double longitude;
  final String description;
  final String image;

  factory Patients.fromRawJson(String str) =>
      Patients.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Patients.fromJson(Map<String, dynamic> json) => Patients(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        gender: genderValues.map[json["gender"]],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": genderValues.reverse[gender],
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "image": image,
      };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({"Female": Gender.FEMALE, "Male": Gender.MALE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
