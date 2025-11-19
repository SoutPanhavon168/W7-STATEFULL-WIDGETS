import 'package:flutter/material.dart';

enum SelectionState {
  selected('Selected', 500, Colors.white),
  notSelected('Not Selected', 200, Colors.black);

  final String label;
  final int shade;
  final Color textColor;

  Color get color => Colors.blue[shade]!;

  const SelectionState(this.label, this.shade, this.textColor);
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: Column(
            children: [
              SelectionButton(),
              SizedBox(height: 20),
              SelectionButton(),
            ],
          ) 
        ),
      ),
    ));

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  SelectionState _selectionState = SelectionState.notSelected;

  void toggleSelection() {
    setState(() {
      _selectionState = _selectionState == SelectionState.notSelected
          ? SelectionState.selected
          : SelectionState.notSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: toggleSelection,
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectionState.color,
        ),
        child: Center(
          child: Text(_selectionState.label, style: TextStyle(color: _selectionState.textColor),),
        ),
      ),
    );
  }
}
