import 'package:flutter/material.dart';
import 'package:flutter_demo/NavBar.dart';
import 'package:flutter_demo/widgets/widgets.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            'Popular',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          actions: [],
        ),
        body: Column(
          children: [CardSwap()],
        ));
  }
}
