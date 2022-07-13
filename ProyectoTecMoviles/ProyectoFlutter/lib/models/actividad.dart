// To parse this JSON data, do
//
//     final actividad = actividadFromMap(jsonString);

import 'dart:convert';

class Actividad {
  Actividad({
    required this.descripcion,
    required this.ubicacion,
    required this.fecha,
    this.imagen,
    required this.nombre,
    this.id,
    this.valido = false,
    this.incidente = false,
  });

  String descripcion;
  String ubicacion;
  String fecha;
  String? imagen;
  String nombre;
  String? id;
  bool valido;
  bool incidente;

  factory Actividad.fromJson(String str) => Actividad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Actividad.fromMap(Map<String, dynamic> json) => Actividad(
        descripcion: json["descripcion"],
        ubicacion: json["ubicacion"],
        fecha: json["fecha"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        valido: json["valido"],
        incidente: json["incidente"],
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "ubicacion": ubicacion,
        "fecha": fecha,
        "imagen": imagen,
        "nombre": nombre,
        "valido": valido,
        "incidente": incidente,
      };

  Actividad copy() => Actividad(
        descripcion: this.descripcion,
        ubicacion: this.ubicacion,
        fecha: this.fecha,
        imagen: this.imagen,
        nombre: this.nombre,
        id: this.id,
        valido: this.valido,
        incidente: this.incidente,
      );
}
