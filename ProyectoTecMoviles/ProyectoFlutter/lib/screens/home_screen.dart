import 'package:flutter/material.dart';
import 'package:flutter_demo/NavBar.dart';
import 'package:flutter_demo/services/services.dart';
import 'package:flutter_demo/widgets/widgets.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final actividadesService = Provider.of<ActividadService>(context);

    return Scaffold(
        //drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            'Noticias',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.login_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwap(),
              CardSlider(),
            ],
          ),
        ));
  }
}
