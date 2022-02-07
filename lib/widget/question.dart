import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key, required this.index,required this.question,required this.totalQuestions}) : super(key: key);

  final String question;
  final int index;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        children: [
          CircleAvatar(backgroundColor : Colors.blue, child: Text("${index +1}/$totalQuestions",style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),), radius: 30,),
          SizedBox(width: 10,),
          Expanded(child: Text("$question",overflow: TextOverflow.visible, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black54 ),)),

        ],
      )
      // Text("Question ${index +1}/$totalQuestions:$question "),
    );
  }
}


