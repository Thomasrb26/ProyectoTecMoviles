import 'package:flutter/material.dart';
import 'package:flutter_demo/NavBar.dart';
import 'package:flutter_demo/screens/screens.dart';
import 'package:flutter_demo/services/services.dart';
import 'package:flutter_demo/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final actividadesService = Provider.of<ActividadService>(context);

    if (actividadesService.isLoading) return LoadingScreen();

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
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: actividadesService.actividades.length,
        itemBuilder: (BuildContext contex, int index) => GestureDetector(
          onTap: () {
            actividadesService.selectedActividad =
                actividadesService.actividades[index].copy();
            Navigator.pushNamed(context, 'activities');
          },
          child: ProductCard(
            actividad: actividadesService.actividades[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          actividadesService.selectedActividad = new Actividad(
            descripcion: '',
            fecha: '',
            nombre: '',
            ubicacion: '',
          );
          Navigator.pushNamed(context, 'activities');
        },
      ),

      /*  body: SingleChildScrollView(
          child: Column(
            children: [
              // CardSwap(),
              //CardSlider(),
            ],
          ),
        )
      */
    );
  }
}
