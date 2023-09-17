import 'package:flutter/material.dart';

class ClubProfile extends StatelessWidget {
  final String title;
  final String subtitle;

  ClubProfile ({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
        body: Text(this.subtitle),
      );
  }
}