import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.indigo,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            _BlueBox(),
            _HeaderIcon(),
            this.child,
          ],
        ));
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(Icons.person_pin, color: Colors.white, size: 100),
      ),
    );
  }
}

class _BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _blueBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), bottom: -50, right: 30),
          Positioned(child: _Bubble(), top: 50, left: 10),
          Positioned(child: _Bubble(), top: 30, right: 30),
          Positioned(child: _Bubble(), top: 22, left: 77),
          Positioned(child: _Bubble(), bottom: 70, right: 66),
          Positioned(child: _Bubble(), bottom: 11, left: 40),
        ],
      ),
    );
  }

  BoxDecoration _blueBackground() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 63, 156, 1)
      ]));
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
