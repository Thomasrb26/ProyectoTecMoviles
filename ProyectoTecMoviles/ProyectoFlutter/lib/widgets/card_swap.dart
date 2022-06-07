import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      //color: Colors.red,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: (_, int index) {
          return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: 'tarjeta'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/e/e4/Cuesta_del_obispo_01.jpg'),
                  image: const NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/e/e4/Cuesta_del_obispo_01.jpg'),
                  fit: BoxFit.cover,
                ),
              ));
        },
      ),
    );
  }
}
