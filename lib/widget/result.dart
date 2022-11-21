import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
  }) : super(key: key);

  final double result;

  @override
  Widget build(BuildContext context) {
    return Text("$result", style: TextStyle(fontSize: 32));
  }
}
