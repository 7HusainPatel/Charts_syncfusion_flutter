import 'package:flutter/material.dart';

enum EnumToggleCalender { week, month, year }

class ToggleButtonsSample extends StatelessWidget {
  ToggleButtonsSample(
      {super.key,
      /* this.calenderString*/ required this.onPressed,
      required this.isSelected});
  // final Function(EnumToggleCalender) calenderString;
  void Function(int) onPressed;
  List<bool> isSelected;
  bool vertical = false;

  List<Widget> calendar = const <Widget>[
    Text("W"),
    Text("M"),
    Text("Y"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      // width: 100,
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: ToggleButtons(
        direction: vertical ? Axis.vertical : Axis.horizontal,
        onPressed: onPressed,

        // borderWidth: 0,

        borderColor: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        selectedBorderColor: Colors.purple[700],
        selectedColor: Colors.black,
        disabledColor: Colors.green,
        fillColor: Colors.white,
        color: Colors.grey, //this is unselected tab text color
        isSelected: isSelected,
        splashColor: Colors.transparent,
        children: calendar,
      ),
    );
  }
}
