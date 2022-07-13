import 'package:flutter/material.dart';
import 'package:flutter_demo/models/actividad.dart';

class ActividadFormPRovider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Actividad actividad;

  ActividadFormPRovider(this.actividad);

  updateAvailability(bool value) {
    print(value);
    this.actividad.valido = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(actividad.nombre);
    print(actividad.descripcion);
    return formKey.currentState?.validate() ?? false;
  }
}
