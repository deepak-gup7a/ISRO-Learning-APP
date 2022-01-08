// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'quiz_page.dart';

class QuizHome extends StatelessWidget {
  const QuizHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> quizes = [
      'Entertainment : Music - Easy',
      'Entertainment : Music - Medium',
      'Entertainment : Music - Hard',
      'Science : Computers - Easy',
      'Science : Computers - Medium',
      'Science : Computers - Hard',
      'Science : Nature - Easy',
      'Science : Nature - Medium',
      'Science : Nature - Hard'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Learning - quizes'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: ListView.builder(
              itemCount: quizes.length,
              itemBuilder: (_, index) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    child: Text(
                      quizes[index],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    onPressed: () {
                      Get.to(QuizPage(
                        id: index,
                        name: quizes[index],
                      ));
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}
