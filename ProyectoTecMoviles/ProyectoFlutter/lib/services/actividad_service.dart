import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ActividadService extends ChangeNotifier {
  final String _baseUrl = 'proyectotecmov-default-rtdb.firebaseio.com';

  File? newPictureFile;

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
    print(url);
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
    print("decodeData");
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

  void updateSelectedProductImage(String path) {
    this.selectedActividad.imagen = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dqwt2f7sz/image/upload?upload_preset=b9ubkxix');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return null;
    }

    this.newPictureFile = null;

    final decodedData = json.decode(resp.body);
    print(resp.body);

    return decodedData['secure_url'];
  }
}
