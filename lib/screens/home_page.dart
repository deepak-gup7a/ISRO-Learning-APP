// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'knowledge.dart';
import 'quiz_home_page.dart';
import 'package:isro_learning/service/api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'ISRO - Indian Space Research Orgnisation',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueGrey, fontSize: 30.0),
          ),
          const SizedBox(
            height: 30.0,
          ),
          TextButton(
            onPressed: () async {
              Get.to(const Knowledge());
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: const Text(
                "Gain ISRO knowledge",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.blueGrey)))),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextButton(
            onPressed: () {
              Get.to(QuizHome());
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: const Text(
                "Test your knowledge ",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.blueGrey)))),
          )
        ],
      ),
    ));
  }
}
