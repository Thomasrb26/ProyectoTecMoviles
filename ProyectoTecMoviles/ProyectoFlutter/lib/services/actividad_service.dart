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
  Future CargarActividades() async {
    final url = Uri.https(_baseUrl, 'actividad.json');
    print(url);
    final resp = await http.get(url);
    print(resp);
    final Map<String, dynamic> actividadesMap = json.decode(resp.body);
    print(actividadesMap);
  }
}
