import 'package:flutter/material.dart';
import 'package:quiz_app/view/Quiz_page.dart';
import 'package:quiz_app/widget/logo.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: appBar(context, Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(margin: EdgeInsets.symmetric(
            horizontal: 20
        ),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Divider(
                color: Colors.white24,
              ),
              RichText(
                  text: TextSpan(style: TextStyle(fontSize: 22), children: <
                      TextSpan>[
                TextSpan(
                    text: "ne",
                    style: TextStyle(color: Colors.white54, fontFamily: 'Raleway')),
                TextSpan(
                    text: "X",
                    style: TextStyle(
                        fontSize: 25, color: Colors.red, fontFamily: 'Raleway')),
                TextSpan(
                    text: "t generation of creativity",
                    style: TextStyle(color: Colors.white54, fontFamily: 'Raleway')),
              ])),
              Divider(
                color: Colors.white24,
              ),
              SizedBox(height: 250,),
              GestureDetector(
                onTap: (){

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => QuizPage()));
                }
                ,
                child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width - 48,
                    child: Text(
                      "Start Quiz",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
