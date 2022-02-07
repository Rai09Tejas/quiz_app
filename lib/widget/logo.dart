import 'package:flutter/material.dart';

Widget appBar(BuildContext context,Color color){
  return RichText(
    text: TextSpan(
        style:TextStyle(fontSize: 28),
        children: <TextSpan>[
          TextSpan(text: 'Kohli',style: TextStyle(fontWeight: FontWeight.w500, color: color) ),
          TextSpan(text: 'MEDIA',style: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue)),
          TextSpan(text: 'Quiz',style: TextStyle(fontWeight: FontWeight.w500, color: color)),
          ]
    ),
  );
}
