import 'package:flutter/material.dart';

final appBar = AppBar(
  elevation: 0.1,
  backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
  title: Text('StuyActivities Dashboard'),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.list),
      onPressed: () {},
    )
  ],
);

// class BackgroundMode extends StatefulWidget {
//   const BackgroundMode({super.key, required this.title});

//   final String title;

//   @override
//   State<BackgroundMode> createState() => _BackgroundModeState();
// }

// class _BackgroundModeState extends State<BackgroundMode> {
//   final List<bool> _selectedMode = <bool>[false, false, true];

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);

//     return ToggleButtons(
//       onPressed: (int index) {
//       setState(() {
//       // The button that is tapped is set to true, and the others to false.
//       for (int i = 0; i < _selectedFruits.length; i++) {
//         _selectedFruits[i] = i == index;
//       }
//     });
//   },