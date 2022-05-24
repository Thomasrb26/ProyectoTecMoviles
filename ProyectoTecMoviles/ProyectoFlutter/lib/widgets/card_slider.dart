import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('titulo',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_, int index) {
                return Container(
                  width: 130,
                  height: 190,
                  color: Colors.green,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
