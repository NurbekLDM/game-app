import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reteyk_app/screens/result.dart';

void main() {
  runApp(const MainApp());
}
//Created by Nurbek L1GHTDreaM
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GamePage(player1Name: '', player2Name: '',)
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  final String player1Name;
  final String player2Name;

  GamePage({required this.player1Name, required this.player2Name});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _min = 1;
  int _max = 100;
  late int _target;
  int _turn = 1; 
  final TextEditingController _guessController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _target = _generateRandomNumber(_min, _max);
  }

  int _generateRandomNumber(int min, int max) {
    final _random = Random();
    return min + _random.nextInt(max - min + 1);
  }

  void _checkGuess() {
    int guess = int.parse(_guessController.text);
    setState(() {
      if (guess == _target) {
        String winner = _turn == 1 ? widget.player1Name : widget.player2Name;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              winner: winner,
              player1Name: widget.player1Name,
              player2Name: widget.player2Name,
            ),
          ),
        );
      } else {
        if (guess < _target) {
          _min = guess + 1;
        } else {
          _max = guess - 1;
        }
        _turn = _turn == 1 ? 2 : 1;
      }
    });
    _guessController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O\'yin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Oraliq: $_min -> $_max'),
            TextField(
              controller: _guessController,
              decoration: InputDecoration(labelText: 'Taxminingizni kiriting'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text('Hozirgi o\'yinchi: ${_turn == 1 ? widget.player1Name : widget.player2Name}'),
           Container(
            margin: const EdgeInsets.only(top: 10),
            child: 
            ElevatedButton(
              onPressed: _checkGuess,
              child: Text('Tekshirish'),
            ),
           )
          ],
        ),
      ),
    );
  }
}

