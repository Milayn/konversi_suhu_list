import 'package:flutter/material.dart';

class dropDownButton extends StatelessWidget {
  const dropDownButton({
    Key? key,
    required this.selectedDropDown,
    required this.listSatuanSuhu,
    required this.onDropdownChanges,
  }) : super(key: key);

  final String selectedDropDown;
  final List<String> listSatuanSuhu;
  final Function onDropdownChanges;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: selectedDropDown,
      items: listSatuanSuhu.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        onDropdownChanges(value);
      },
    );
  }
}
