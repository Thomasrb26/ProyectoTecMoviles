import 'package:flutter/material.dart';
import 'package:flutter_demo/providers/actividad_form_provider.dart';
import 'package:flutter_demo/screens/ui/input_decorations.dart';
import 'package:flutter_demo/services/services.dart';
import 'package:flutter_demo/widgets/widgets.dart';
import 'package:http/retry.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final actividadService = Provider.of<ActividadService>(context);

    return ChangeNotifierProvider(
        create: (_) =>
            ActividadFormPRovider(actividadService.selectedActividad),
        child: _ActividadScreenBody(actividadService: actividadService));
    //return _ActividadScreenBody(actividadService: actividadService);
  }
}

class _ActividadScreenBody extends StatelessWidget {
  const _ActividadScreenBody({
    Key? key,
    required this.actividadService,
  }) : super(key: key);

  final ActividadService actividadService;

  @override
  Widget build(BuildContext context) {
    final actividadForm = Provider.of<ActividadFormPRovider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(url: actividadService.selectedActividad.imagen),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.pushNamed(context, 'home'),
                    icon: Icon(Icons.arrow_back_ios_new,
                        size: 40, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {
                      //TODO camara o galeria
                      final picker = new ImagePicker();
                      final XFile? pickedFile = await picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 100,
                      );

                      if (pickedFile == null) {
                        print('no seleccion?? nada');
                        return;
                      }

                      print('tenemos imagen ${pickedFile.path}');

                      actividadService
                          .updateSelectedProductImage(pickedFile.path);
                    },
                    icon: Icon(Icons.camera_alt_outlined,
                        size: 40, color: Colors.white),
                  ),
                )
              ],
            ),
            _ActividadForm(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: actividadService.isSaving
            ? CircularProgressIndicator(color: Colors.white)
            : Icon(Icons.save_outlined),
        onPressed: actividadService.isSaving
            ? null
            : () async {
                if (!actividadForm.isValidForm()) return;

                final String? imageUrl = await actividadService.uploadImage();

                print(imageUrl);

                if (imageUrl != null) actividadForm.actividad.imagen = imageUrl;

                await actividadService
                    .saveOrCreateActividad(actividadForm.actividad);
              },
      ),
    );
  }
}

class _ActividadForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final actividadForm = Provider.of<ActividadFormPRovider>(context);
    final actividad = actividadForm.actividad;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: actividadForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                initialValue: actividad.nombre,
                onChanged: (value) => actividad.nombre = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'nombre actividad',
                  labelText: 'Nombre',
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                initialValue: actividad.descripcion,
                onChanged: (value) => actividad.descripcion = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La descripcion es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'descripcion actividad',
                  labelText: 'Descripcion',
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                initialValue: actividad.ubicacion,
                onChanged: (value) => actividad.ubicacion = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La ubicacion es obligatoria';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'ubicacion',
                  labelText: 'ubicacion',
                ),
              ),
              SizedBox(height: 30),
              SwitchListTile.adaptive(
                value: actividad.valido,
                title: Text('Valido'),
                activeColor: Colors.indigo,
                onChanged: (value) {
                  actividadForm.updateAvailabilityValido(value);
                },
              ),
              SizedBox(height: 30),
              SwitchListTile.adaptive(
                value: actividad.incidente,
                title: Text('Incidente?'),
                activeColor: Colors.indigo,
                onChanged: (value) {
                  actividadForm.updateAvailabilityIncidente(value);
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]);
}
