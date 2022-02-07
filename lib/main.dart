import 'package:flutter/material.dart';
import 'package:quiz_app/models/database.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/view/home.dart';

void main() {
  var db = Database();
  // db.addQuestion(Question(id: '20', title: 'What is my sirname', options: {'10':false, '20': true, '60': false,'80':false}));

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
