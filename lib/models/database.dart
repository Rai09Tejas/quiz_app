import 'package:http/http.dart' as http; // the http package
import './question_model.dart';
import 'dart:convert';

class Database {
  // let's first create  a function to add a question to our database.
// declare the name of the table you want to create and add .json as suffix
  final url = Uri.parse(
      'https://quiz-4fb0a-default-rtdb.firebaseio.com/questions.json');

  // fetch the data from database
  Future<List<Question>> fetchQuestion() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          title: value['title'],
          options: Map.castFrom(value['options']), id: 'key',
        );
        // add to newQuestions
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });
  }
}





