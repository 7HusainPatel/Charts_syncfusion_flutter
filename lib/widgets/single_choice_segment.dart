import 'package:flutter/material.dart';

class SingleChoiceSegment extends StatefulWidget {
  const SingleChoiceSegment({super.key});

  @override
  State<SingleChoiceSegment> createState() => _SingleChoiceSegmentState();
}

enum Calendar { W, M, Y }

class _SingleChoiceSegmentState extends State<SingleChoiceSegment> {
  Calendar calendarView = Calendar.Y;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      // style: ButtonStyle(b),
      showSelectedIcon: false,

      style: ButtonStyle(
        // padding: MaterialStateProperty<EdgeInsetsGeometry?> ,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
        shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),

        overlayColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
          return Colors.white;
        }),
        side: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          return BorderSide(
              color: states.contains(MaterialState.pressed)
                  ? Colors.purple
                  : Colors.transparent);
        }),

        backgroundColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
          return states.contains(MaterialState.selected)
              ? Colors.white
              : Colors.grey.shade200;
        }),
        foregroundColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
          return states.contains(MaterialState.selected)
              ? Colors.black
              : Colors.grey;
        }),
      ),
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.W,
          label: Text('W'),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.M,
          label: Text('M'),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.Y,
          label: Text('Y'),
        ),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}
