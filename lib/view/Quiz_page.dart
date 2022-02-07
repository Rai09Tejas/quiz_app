import 'package:flutter/material.dart';
import 'package:quiz_app/view/home.dart';
import '../models/question_model.dart'; // our question model
import '../widget/question.dart'; // the question widget
import '../widget/next_button.dart';
import '../widget/options.dart';
import '../widget/result.dart';
import '../models/database.dart';
import '../widget/logo.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var db = Database();

  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestion();
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  int index = 0;
  int score = 0;
  int correct = 0;
  int incorrect = 0;
  int attempted = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;


  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => Result(
            score: score,
            onPressed: startOver,
          ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score+=5;
      }
      else{
        score-=3;
      }
    }
    setState(() {
      isPressed = true;
      isAlreadySelected = true;
    });
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      incorrect = 0;
      correct = 0;
      attempted = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
                appBar: AppBar(
                  title: appBar(context,Colors.black54),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                ),
                body: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Card(
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                                children: [
                                  SizedBox(height: 5,),
                                  Text('Score: ${score}',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 8,),
                                  Text('Attempted: ${attempted}',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                ]
                            ),
                            Column(
                              children: [
                                SizedBox(height: 5,),
                                Text('Correct: ${correct}',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                                SizedBox(height: 8,),
                                Text('Incorrect: ${incorrect}',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Divider(color: Colors.black),
                      QuestionWidget(index: index, question: extractedData[index].title, totalQuestions:extractedData.length,                     ),
                      Divider(color: Colors.black),
                      SizedBox(height: 25.0),
                      for (int i = 0; i < extractedData[index].options.length; i++)
                        GestureDetector(
                          onTap: () => checkAnswerAndUpdate(extractedData[index].options.values.toList()[i]),
                          child: OptionCard(
                            option: extractedData[index].options.keys.toList()[i],
                            color:isPressed ? extractedData[index].options.values.toList()[i] == true ? Colors.green : Colors.red : Colors.blue,
                          ),
                        ),
                    ],
                  ),
                ),

                bottomNavigationBar: BottomAppBar(
                    child:
                    GestureDetector(
                        onTap: () => nextQuestion(extractedData.length),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: NextButton(),
                        ))));
          }
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20.0),
                Text(
                  'Please Wait while Questions are loading..',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          );
        }

        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
