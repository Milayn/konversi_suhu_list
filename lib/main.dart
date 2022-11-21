import 'package:flutter/material.dart';
import 'package:konversi_suhu_list/widget/button.dart';
import 'package:konversi_suhu_list/widget/dropDownButton.dart';
import 'package:konversi_suhu_list/widget/inputSuhu.dart';
import 'package:konversi_suhu_list/widget/result.dart';
import 'package:konversi_suhu_list/widget/riwayatKonversi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Fahrenheit'];
  String selectedDropDown = "Kelvin";
  double result = 0.0;
  List<String> listResult = [];

  void onDropDownChanges(Object? value) {
    return setState(() {
      selectedDropDown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case "Kelvin":
            result = double.parse(etInput.text) + 273.15;
            break;
          case "Reamur":
            result = double.parse(etInput.text) * 4 / 5;
            break;
          case "Fahrenheit":
            result = (double.parse(etInput.text) + 9 / 5) + 32;
            break;
        }
        listResult.add(selectedDropDown + ": " + result.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            inputSuhu(etInput: etInput),
            const SizedBox(height: 8),
            dropDownButton(
                selectedDropDown: selectedDropDown,
                listSatuanSuhu: listSatuanSuhu,
                onDropdownChanges: onDropDownChanges),
            const SizedBox(height: 10),
            const Text(
              "Hasil",
              style: TextStyle(fontSize: 20),
            ),
            Result(result: result),
            const SizedBox(height: 10),
            Row(
              children: [
                button(konversiSuhu: konversiSuhu),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Riwayat Konversi', style: TextStyle(fontSize: 20)),
            riwayatKonversi(listResult: listResult)
          ],
        ),
      ),
    );
  }
}
