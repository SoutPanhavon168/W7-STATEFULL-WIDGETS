import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 137, 14),
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Score Bars'),  
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: const [
                ScoreBarCard(title: 'Flutter Score', maxScore: 10),
                ScoreBarCard(title: 'Dart Score', maxScore: 20),
                ScoreBarCard(title: 'Python Score', maxScore: 15),
              ],
            ),
          ),
        )
    ),
  ),
);
class ScoreBarCard extends StatefulWidget {
  final String title;
  final int maxScore;

  const ScoreBarCard({
    super.key,
    required this.title,
    this.maxScore = 10,
  });

  @override
  State<ScoreBarCard> createState() => _ScoreBarCardState();
}

class _ScoreBarCardState extends State<ScoreBarCard> {
  int selectedScore = 0;

  void increaseScore() {
    setState(() {
      if (selectedScore < widget.maxScore) selectedScore++;
    });
  }

  void decreaseScore() {
    setState(() {
      if (selectedScore > 0) selectedScore--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decreaseScore,
                  child: const Text('-', style: TextStyle(fontSize: 24)),
                ),
                const SizedBox(width: 20),
                Text(
                  '$selectedScore / ${widget.maxScore}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: increaseScore,
                  child: const Text('+', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ProgressBar(selectedScore: selectedScore, maxScore: widget.maxScore, height: 40),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final int selectedScore;
  final int maxScore;
  final double height;

  const ProgressBar({
    super.key,
    required this.selectedScore,
    required this.maxScore,
    this.height = 25,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = selectedScore / maxScore;
    return Stack(
      children: [
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: height,
          width: MediaQuery.of(context).size.width * percentage,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
