import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.score, required this.onPressed}) : super(key: key);

  final int score;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Padding(
        padding: const EdgeInsets.all(70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Quiz Completed Sucessfully",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
            SizedBox(height: 10,),
            Text("Score ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
            SizedBox(height: 20,),
            CircleAvatar(backgroundColor : Colors.blue, child: Text("$score",style: TextStyle(fontSize: 30, color: Colors.white),), radius: 50,),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: onPressed,
              child: Card(color:Colors.blue,child: Text(" Start Again? ",style: TextStyle(fontSize: 20, color: Colors.white))),
            )


          ],
        ),
      ),
    );
  }
}
