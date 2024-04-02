import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class SingleClassModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleClassModel({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State<QuizApp> {
  List allQuestions = [
    const SingleClassModel(
      question: "When and where was Chhatrapati Shivaji Maharaj born?",
      options: [
        "11 February 1635, Shivneri Fort",
        " 19 February 1630, Shivneri Fort",
        " 29 February 1630, Raigad Fort",
        " 19 February 1635, Raigad Fort"
      ],
      answerIndex: 1,
    ),
    const SingleClassModel(
      question:
          "At what age did Chhatrapati Shivaji Maharaj captured first fort?",
      options: ["15 Years", " 25 Years", " 16 Years", " 20 Years"],
      answerIndex: 2,
    ),
    const SingleClassModel(
      question:
          "When and where was Chhatrapati Shivaji Maharaj crowned for Hindavi Swarajya?",
      options: [
        "6 June 1674, Raigad Fort",
        " 19 February 1630, Shivneri Fort",
        " 3 April 1680, Raigad Fort",
        " 6 November 1650, Shivneri Fort"
      ],
      answerIndex: 0,
    ),
    const SingleClassModel(
      question: "Who is known as Father of Indian Navy?",
      options: [
        "Bajirao Peshwa",
        " Chhatrapati Sambhaji Maharaj",
        " Netaji Subhas Chandra Bose",
        " Chhatrapati Shivaji Maharaj"
      ],
      answerIndex: 3,
    ),
    const SingleClassModel(
      question:
          "Which Guerrilla Tactics did Chhatrapati Shivaji Maharaj pioneered?",
      options: [
        "Chola Naval Tactics",
        " Kutiyattam Warfare",
        " Ganimi Kava",
        " Sikh Military Tactics"
      ],
      answerIndex: 2,
    ),
  ];

  bool questionScreen = true;
  int questionIndex = 0;
  int selectedAnsIndex = -1;
  int correctAnsCount = 0;

  MaterialStatePropertyAll<Color?> changeAnsColor(int buttonInd) {
    if (selectedAnsIndex != -1) {
      if (buttonInd == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonInd == selectedAnsIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validateCurrentPage() {
    if (selectedAnsIndex == -1) {
      return;
    }
    if (selectedAnsIndex == allQuestions[questionIndex].answerIndex) {
      correctAnsCount += 1;
    }

    if (selectedAnsIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        setState(() {
          questionScreen = false;
        });
      }

      selectedAnsIndex = -1;
      setState(() {
        questionIndex += 1;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 215, 198, 231),
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.orange,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
              width: 170,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Question: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${questionIndex + 1}/${allQuestions.length}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 380,
              height: 200,
              padding: const EdgeInsets.all(10),
              child: Text(
                allQuestions[questionIndex].question,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size.fromWidth(300)),
                backgroundColor: changeAnsColor(0),
              ),
              onPressed: () {
                if (selectedAnsIndex == -1) {
                  setState(() {
                    selectedAnsIndex = 0;
                  });
                }
              },
              child: Text(
                "A. ${allQuestions[questionIndex].options[0]}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size.fromWidth(300)),
                backgroundColor: changeAnsColor(1),
              ),
              onPressed: () {
                if (selectedAnsIndex == -1) {
                  setState(() {
                    selectedAnsIndex = 1;
                  });
                }
              },
              child: Text(
                "B.${allQuestions[questionIndex].options[1]}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size.fromWidth(300)),
                backgroundColor: changeAnsColor(2),
              ),
              onPressed: () {
                if (selectedAnsIndex == -1) {
                  setState(() {
                    selectedAnsIndex = 2;
                  });
                }
              },
              child: Text(
                "C.${allQuestions[questionIndex].options[2]}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size.fromWidth(300)),
                backgroundColor: changeAnsColor(3),
              ),
              onPressed: () {
                if (selectedAnsIndex == -1) {
                  setState(() {
                    selectedAnsIndex = 3;
                  });
                }
              },
              child: Text(
                "D.${allQuestions[questionIndex].options[3]}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            validateCurrentPage();
          },
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.flag,
            color: Colors.orange,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 215, 198, 231),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Quiz App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              )),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              "https://m.economictimes.com/thumb/height-450,width-600,imgsize-10850,msid-107811680/shivaji.jpg",
              height: 300,
              width: 450,
            ),
            const Text(
              "Congratulations!!",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "You have completed the quiz",
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text("Score: $correctAnsCount/${allQuestions.length}"),
            SizedBox(
              height: 180,
            ),
            ElevatedButton(
              onPressed: () {
                questionIndex = 0;
                questionScreen = true;
                correctAnsCount = 0;
                selectedAnsIndex = -1;

                setState(() {});
              },
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
