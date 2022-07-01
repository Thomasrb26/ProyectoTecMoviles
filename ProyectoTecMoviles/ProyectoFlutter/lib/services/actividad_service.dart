import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/models.dart';
import 'package:http/http.dart' as http;

class ActividadService extends ChangeNotifier {
  final String _baseUrl = 'proyectotecmov-default-rtdb.firebaseio.com';

  final List<Actividad> actividades = [];
  late Actividad selectedActividad;

  bool isLoading = true;
  bool isSaving = false;

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

  Future saveOrCreateActividad(Actividad actividad) async {
    isSaving = true;
    notifyListeners();

    if (actividad.id == null) {
      //Crear actividad
      await this.createActividad(actividad);
    } else {
      //actualizar
      await this.updateActividad(actividad);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateActividad(Actividad actividad) async {
    final url = Uri.https(_baseUrl, 'actividad/${actividad.id}.json');

    final resp = await http.put(url, body: actividad.toJson());

    final decodedData = resp.body;

    print(decodedData);

    //TODO actualizar listado de productos

    final index =
        this.actividades.indexWhere((element) => element.id == actividad.id);

    this.actividades[index] = actividad;
    return actividad.id!;
  }

  Future<String> createActividad(Actividad actividad) async {
    final url = Uri.https(_baseUrl, 'actividad.json');

    final resp = await http.post(url, body: actividad.toJson());

    final decodedData = json.decode(resp.body);

    print(decodedData);

    actividad.id = decodedData['name'];

    this.actividades.add(actividad);

    //TODO actualizar listado de productos

    return actividad.id!;
  }
}
