import 'package:flutter/material.dart';
import 'package:flutter_demo/NavBar.dart';
import 'package:flutter_demo/screens/screens.dart';
import 'package:flutter_demo/services/services.dart';
import 'package:flutter_demo/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'package:badges/badges.dart';

class usuarioHomeScreen extends StatefulWidget {
  const usuarioHomeScreen({Key? key}) : super(key: key);

  @override
  State<usuarioHomeScreen> createState() => _usuarioHomeScreen();
}

class _usuarioHomeScreen extends State<usuarioHomeScreen> {
  int _selectedIndex = 0;

  void recargarHome() {
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final actividadesService = Provider.of<ActividadService>(context);

    List<Actividad> listaActividades = actividadesService.actividades;

    String setEstadoMenu() {
      if (_selectedIndex == 0) {
        return 'Actividad';
      } else {
        return 'Incidente';
      }
    }

    String getTitle() {
      if (_selectedIndex == 0) {
        return 'AlertasDFSD Nuevas';
      } else {
        return 'AlertasEDFRSD Aceptadas';
      }
    }

    List<Actividad> filtrarActividad() {
      return listaActividades
          .where((actividad) => actividad.estado == setEstadoMenu())
          .toList();
    }

    List<Actividad> listaFilrada = filtrarActividad();
    final authService = Provider.of<AuthService>(context);

    int getNuevasAlertas() {
      int cantidad = 0;
      for (var i = 0; i < listaActividades.length; i++) {
        if (listaActividades[i].estado == 'Nueva') {
          cantidad++;
        }
      }
      return cantidad;
    }

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
      bottomNavigationBar: menuNavegacion(getNuevasAlertas()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                getTitle(),
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          actividadesService.selectedActividad = new Actividad(
            descripcion: '',
            fecha: '',
            nombre: '',
          );
          Navigator.pushNamed(context, 'activities');
        },
      ),
    );
  }

  BottomNavigationBar menuNavegacion(int cantidad) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Badge(
            showBadge: true,
            badgeContent:
                Text('$cantidad', style: const TextStyle(color: Colors.white)),
            animationType: BadgeAnimationType.scale,
            shape: BadgeShape.circle,
            //position: BadgePosition.center(),
            child: const Icon(Icons.playlist_add),
          ),
          label: 'Actividad',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.timer_sharp),
          label: 'Incidente',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
