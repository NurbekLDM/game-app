import 'package:flutter/material.dart';
import './game.dart';


void main(){
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
 const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: InitiatePage()
      ),
    );
}
}

class InitiatePage extends StatefulWidget {
  @override
  _InitiatePageState createState() => _InitiatePageState();
}

class _InitiatePageState extends State<InitiatePage> {
  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O\'yinni boshlash'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _player1Controller,
              decoration: InputDecoration(labelText: 'Player 1 ismi'),
            ),
            TextField(
              controller: _player2Controller,
              decoration: InputDecoration(labelText: 'Player 2 ismi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GamePage(
                      player1Name: _player1Controller.text,
                      player2Name: _player2Controller.text,
                    ),
                  ),
                );
              },
              child: Text('O\'yin'),
            ),
          ],
        ),
      ),
    );
  }
}

//Created by Nurbek L1GHTDreaM 










