import 'game.dart';
import '../main.dart';
import 'dart:math';
import 'package:flutter/material.dart';

//Nurbek Aliqo'ziyev 

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResultPage(winner: '', player1Name: '', player2Name: ''),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String winner;
  final String player1Name;
  final String player2Name;

  ResultPage({
    required this.winner,
    required this.player1Name,
    required this.player2Name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 180, 233),
      body: Stack(
        children: [
          Positioned.fill(child: MovingDotsBackground()),
          Column(
            children: [
              Container(
                color: Colors.amber,
                margin: const EdgeInsets.only(top: 200, left: 110),
                width: 300,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'G\'olib: $winner',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GamePage(
                                      player1Name: player1Name,
                                      player2Name: player2Name)),
                              (route) => false,
                            );
                          },
                          child: Text('Yana o\'ynash'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LandPage(),
                              ),
                            );
                          },
                          child: Text('Bosh Sahifa'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//Nurbek Aliqo'ziyev
class MovingDotsBackground extends StatefulWidget {
  @override
  _MovingDotsBackgroundState createState() => _MovingDotsBackgroundState();
}

class _MovingDotsBackgroundState extends State<MovingDotsBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Offset> _positions;
  final int _numDots = 50;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10), 
      vsync: this,
    )..repeat();
    _positions = List.generate(
        _numDots,
        (index) => Offset(
            _random.nextDouble() * 600, _random.nextDouble() * 600));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updatePositions() {
    setState(() {
      for (int i = 0; i < _numDots; i++) {
        _positions[i] = Offset(
          (_positions[i].dx + _random.nextDouble() * 2 - 1) % 600,
          (_positions[i].dy + _random.nextDouble() * 2 - 1) % 600, 
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(_updatePositions);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: DotPainter(_positions),
        );
      },
    );
  }
}

class DotPainter extends CustomPainter {
  final List<Offset> positions;

  DotPainter(this.positions);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    for (var position in positions) {
      canvas.drawCircle(position, 5.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
