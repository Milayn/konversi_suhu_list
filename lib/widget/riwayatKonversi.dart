import 'package:flutter/material.dart';

class riwayatKonversi extends StatelessWidget {
  const riwayatKonversi({
    Key? key,
    required this.listResult,
  }) : super(key: key);

  final List<String> listResult;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: listResult.length,
      itemBuilder: (context, index) {
        return Text(listResult[index]);
      },
    ));
  }
}
