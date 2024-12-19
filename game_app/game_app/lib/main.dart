import 'package:flutter/material.dart';
import './screens/intitate.dart';
import './screens/result.dart';

//Created by Nurbek L1GHTDreaM 

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LandPage()
      ),
    );
  }
}


class LandPage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 180, 233),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 120, left: 130),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/pictures/Entrance-logo.png'),
                radius: 115,
                
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, left: 130),
              width: 250,
              height: 40,
              child:
            TextButton(
              style: const ButtonStyle(
                backgroundColor:  MaterialStatePropertyAll(Colors.green)
              ),
            onPressed:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InitiatePage()),
              );
            }, 
            child: const Text('O\'yinni boshlash', style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            )
            )
            )
          ],
        ),
      ),
    );
  }
}