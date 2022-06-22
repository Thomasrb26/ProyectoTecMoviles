import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
