// To parse this JSON data, do
//
//     final actividad = actividadFromMap(jsonString);

import 'dart:convert';

class Actividad {
  Actividad({
    required this.descripcion,
    this.edificio,
    required this.fecha,
    required this.nombre,
    this.sala,
  });

  String descripcion;
  String? edificio;
  String fecha;
  String nombre;
  String? sala;

  factory Actividad.fromJson(String str) => Actividad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Actividad.fromMap(Map<String, dynamic> json) => Actividad(
        descripcion: json["descripcion"],
        edificio: json["edificio"],
        fecha: json["fecha"],
        nombre: json["nombre"],
        sala: json["sala"],
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "edificio": edificio,
        "fecha": fecha,
        "nombre": nombre,
        "sala": sala,
      };
}
