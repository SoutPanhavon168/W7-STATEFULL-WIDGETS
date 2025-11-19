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
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Score Bars'),  
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ScoreBarCard(title: 'Card 1', maxScore: 10),
                ScoreBarCard(title: 'Card 2', maxScore: 20),
                ScoreBarCard(title: 'Card 3', maxScore: 15),
              ],
            ),
          ),
        )
    ),
  ),
);
class ScoreBarCard extends StatefulWidget {
  final String title; // optional, if you want to label each card
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ProgressBar(selectedScore: selectedScore, maxScore: widget.maxScore),
            const SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final int selectedScore;
  final int maxScore;

  const ProgressBar({
    super.key,
    required this.selectedScore,
    required this.maxScore,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = selectedScore / maxScore;
    return Stack(
      children: [
        Container(
          height: 20,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 20,
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
