import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:isro_learning/model/question.dart';

class QuizPage extends StatefulWidget {
  int id = 0;
  String name = '';
  QuizPage({required this.id, required this.name});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [];
  List<String> selectedAns = [];
  bool showAnswers = false;

  _onSubmit() {
    showAnswers = true;
    setState(() {});
    int count = 0, correct = 0, i = 0;
    for (String s in selectedAns) {
      if (s != '') {
        count++;
      }
      if (s == questions[i].ans) {
        correct++;
      }
      i++;
    }
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Your Score '),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Question Submitted : ' + count.toString()),
                Text('Correct Answers : ' + correct.toString()),
              ],
            ),
          );
        });
  }

  _getQuizQuestions() async {
    String name = 'EntertainmentAndMusic.json';
    if (widget.id > 2 && widget.id < 6) {
      name = 'ScienceAndComputers.json';
    } else if (widget.id > 5) {
      name = 'ScienceAndNature.json';
    }
    String data =
        await DefaultAssetBundle.of(context).loadString("quiz_data/${name}");
    final res = jsonDecode(data);
    if (widget.id % 3 == 0) {
      for (var ques in res['results']) {
        if (ques['difficulty'] == 'easy') {
          List<String> options = [];
          for (String s in ques['incorrect_answers']) {
            options.add(s);
          }
          int num = Random().nextInt(3);
          options.insert(num, ques['correct_answer']);
          questions.add(Question(
              question: ques['question'],
              ans: ques['correct_answer'],
              options: options));
          selectedAns.add('');
        }
      }
    } else if (widget.id % 3 == 1) {
      for (var ques in res['results']) {
        if (ques['difficulty'] == 'medium') {
          List<String> options = [];
          for (String s in ques['incorrect_answers']) {
            options.add(s);
          }
          int num = Random().nextInt(3);
          options.insert(num, ques['correct_answer']);
          questions.add(Question(
              question: ques['question'],
              ans: ques['correct_answer'],
              options: options));
          selectedAns.add('');
        }
      }
    } else {
      for (var ques in res['results']) {
        if (ques['difficulty'] == 'hard') {
          List<String> options = [];
          for (String s in ques['incorrect_answers']) {
            options.add(s);
          }
          int num = Random().nextInt(3);
          options.insert(num, ques['correct_answer']);
          questions.add(Question(
              question: ques['question'],
              ans: ques['correct_answer'],
              options: options));
          selectedAns.add('');
        }
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getQuizQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
        ),
        actions: [
          Center(
              child: TextButton(
                  onPressed: () {
                    _onSubmit();
                  },
                  child: const Text(
                    "submit",
                    style: TextStyle(color: Colors.yellow),
                  )))
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (_, index) {
                // return ListTile(
                //   leading: Text((index+1).toString()),
                //   title: Text(snapshot.data['results'][index]['question']),
                // );
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ques. ' +
                            (index + 1).toString() +
                            '.  ' +
                            questions[index].question,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      TextButton(
                        onPressed: () {
                          selectedAns[index] = questions[index].options[0];
                          setState(() {});
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => showAnswers == false
                                    ? ((selectedAns[index] ==
                                            questions[index].options[0])
                                        ? Colors.blueGrey
                                        : Colors.white)
                                    : ((selectedAns[index] ==
                                            questions[index].options[0])
                                        ? (selectedAns[index] ==
                                                questions[index].ans
                                            ? Colors.green
                                            : Colors.red)
                                        : Colors.white))),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.album_outlined,
                              size: 10.0,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(questions[index].options[0],
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          selectedAns[index] = questions[index].options[1];
                          setState(() {});
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => showAnswers == false
                                    ? ((selectedAns[index] ==
                                            questions[index].options[1])
                                        ? Colors.blueGrey
                                        : Colors.white)
                                    : ((selectedAns[index] ==
                                            questions[index].options[1])
                                        ? (selectedAns[index] ==
                                                questions[index].ans
                                            ? Colors.green
                                            : Colors.red)
                                        : Colors.white))),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.album_outlined,
                              size: 10.0,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(questions[index].options[1],
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          selectedAns[index] = questions[index].options[2];
                          setState(() {});
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => showAnswers == false
                                    ? ((selectedAns[index] ==
                                            questions[index].options[2])
                                        ? Colors.blueGrey
                                        : Colors.white)
                                    : ((selectedAns[index] ==
                                            questions[index].options[2])
                                        ? (selectedAns[index] ==
                                                questions[index].ans
                                            ? Colors.green
                                            : Colors.red)
                                        : Colors.white))),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.album_outlined,
                              size: 10.0,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(questions[index].options[2],
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          selectedAns[index] = questions[index].options[3];
                          setState(() {});
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => showAnswers == false
                                    ? ((selectedAns[index] ==
                                            questions[index].options[3])
                                        ? Colors.blueGrey
                                        : Colors.white)
                                    : ((selectedAns[index] ==
                                            questions[index].options[3])
                                        ? (selectedAns[index] ==
                                                questions[index].ans
                                            ? Colors.green
                                            : Colors.red)
                                        : Colors.white))),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.album_outlined,
                              size: 10.0,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(questions[index].options[3],
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          // Expanded(child: Container(),flex: 0,),
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              thickness: 1.0,
                            ),
                            flex: 30,
                          ),
                          // Expanded(child: Container(),flex: 0,)
                        ],
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
