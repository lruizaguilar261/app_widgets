import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_widgets/autenticacion_firebase.dart';

class EstadoConeccionFirebase extends StatefulWidget{
  EstadoConeccionFirebase({Key? key}):super(key:key);

  @override
  State<EstadoConeccionFirebase> createState()=> _EstadoConeccionFirebase();

}

class _EstadoConeccionFirebase extends State<EstadoConeccionFirebase>{
  //Initialize firebase app
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp= await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return EstadoAutenticacion();
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}