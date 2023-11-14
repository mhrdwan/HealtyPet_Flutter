import 'package:healty_pet/models/service_models.dart';

class DoctorModel {
  String name;
  String image;
  List<String> services;
  int jarak;

  DoctorModel(
      {required this.name,
      required this.image,
      required this.services,
      required this.jarak});
}

var doctors = [
  DoctorModel(
      name: "Dr. Sarah",
      image: "assets/img/doctor1.jpg",
      services: [ServiceWoi.surgery],
      jarak: 2),
  DoctorModel(
      name: "Dr. John",
      image: "assets/img/doctor2.png",
      services: [ServiceWoi.vaccine],
      jarak: 4),
  DoctorModel(
      name: "Dr. Emily",
      image: "assets/img/doctor1.jpg",
      services: [ServiceWoi.consultation],
      jarak: 5),
];
