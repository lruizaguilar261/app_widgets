import 'package:flutter/material.dart';
import 'package:app_widgets/autenticacion_firebase.dart';

void main() {
  runApp(MiAppAutenticacion());
}

class MiAppAutenticacion extends StatelessWidget{
  MiAppAutenticacion({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Apps Autenticacion",
      home: new Scaffold(
        //appBar: AppBar(title: Text("Autenticacion con Firebase"),),
        body: new EstadoAutenticacion(),
      ),
    );
  }

}