import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/models.dart';
import 'package:http/http.dart' as http;

class ActividadService extends ChangeNotifier {
  final String _baseUrl = 'proyectotecmov-default-rtdb.firebaseio.com';

  final List<Actividad> actividades = [];

  bool isLoading = true;

  ActividadService() {
    this.CargarActividades();
  }

  //TODO <List<Product>>
  Future<List<Actividad>> CargarActividades() async {
    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'actividad.json');

    final resp = await http.get(url);

    final Map<String, dynamic> actividadesMap = json.decode(resp.body);
    print(actividadesMap);

    actividadesMap.forEach((key, value) {
      final tempActividad = Actividad.fromMap(value);
      tempActividad.id = key;
      this.actividades.add(tempActividad);
    });

    print(this.actividades[0].descripcion);

    this.isLoading = false;
    notifyListeners();
    return this.actividades;
  }
}
