import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('titulo',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          _SliderBajo(),
          //Expanded(
          //child: ListView.builder(
          //scrollDirection: Axis.horizontal,
          //itemCount: 5,
          //itemBuilder: (_, int index) {
          //return _SliderBajo();
          //},
          //),
          //),
        ],
      ),
    );
  }
}

class _SliderBajo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 190,
      color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(children: [
        Text(
          'Infojksdjlksdjfklsdjfsldjfkslfjlsjfskljfskljfsjsjdfjsdkfjlskdfjijflskjefisdlfjsieofjosiejfiosejflsejflk',
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}

class _Comented extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
