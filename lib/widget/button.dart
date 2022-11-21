import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const button({
    Key? key,
    required this.konversiSuhu,
  }) : super(key: key);
  final Function konversiSuhu;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              konversiSuhu();
            },
            child: Text("Konversi Suhu")));
  }
}
