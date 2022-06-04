import 'package:flutter/material.dart';
import 'package:flutter_demo/models/models.dart';

class ActividadService extends ChangeNotifier {
  final String _baseUrl = 'proyectotecmov-default-rtdb.firebaseio.com ';

  final List<Actividad> actividades = [];
}
