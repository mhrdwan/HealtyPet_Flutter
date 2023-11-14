import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:healty_pet/models/doctor_models.dart';
import 'package:healty_pet/models/service_models.dart';

var menuicon = [
  FeatherIcons.home,
  FeatherIcons.heart,
  FeatherIcons.messageCircle,
  FeatherIcons.user,
];

var selectedvervice = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      bottomNavigationBar: _navbar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _selamatdatang(),
            const SizedBox(
              height: 17,
            ),
            _card(context),
            const SizedBox(
              height: 20,
            ),
            _search(),
            const SizedBox(
              height: 20,
            ),
            _services(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            _doctors()
          ],
        ),
      )),
    );
  }

  ListView _doctors() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var doctor = doctors[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(0, 2),
                    blurRadius: 6),
              ]),
          child: Row(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(doctor.image, width: 88, height: 103)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Text(doctor.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(doctor.jarak.toString() + " " + "Km",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 11),
      itemCount: doctors.length,
    );
  }

  Container _navbar() => Container(
        height: 76,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                // blurRadius: 30,
                offset: Offset(0, 0 - 10))
          ],
          color: Colors.white,
        ),
        child: Row(
          children: menuicon.map((e) => Expanded(child: Icon(e))).toList(),
        ),
      );

  SizedBox _services() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: selectedvervice == index
                        ? Color(0xFF818AF9)
                        : Color(0XFFF6F6F6)),
                child: Center(
                    child: Text(ServiceWoi.all()[index],
                        style: TextStyle(
                            color: selectedvervice == index
                                ? Colors.white
                                : Colors.black))),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: ServiceWoi.all().length),
    );
  }

  Widget _search() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(14)),
        child: TextFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              FeatherIcons.search,
              color: Color(0xFFADACAD),
            ),
            hintText: "Find best vaccinate",
          ),
        ));
  }

  Container _card(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF818AF9),
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 1, // Mengatur proporsi lebar untuk teks dan tombol
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Catrine will get vaccination tomorrow at 07.00 am!",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(onPressed: null, child: Text("See details"))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Image.asset(
                'assets/img/mukakucing.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _selamatdatang() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text("Halo Selamat Datang",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}
