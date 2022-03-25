import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_widgets/w_tabbar.dart';



class EstadoAutenticacion extends StatefulWidget{
  EstadoAutenticacion({Key? key}):super(key:key);

  @override
  State<EstadoAutenticacion> createState() => _EstadoAutenticacion();
}

class _EstadoAutenticacion extends State<EstadoAutenticacion>{

  //Login function
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
    FirebaseAuth auth=FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential= await auth.signInWithEmailAndPassword(email: email, password: password);
      user= userCredential.user;
    }on FirebaseAuthException catch(e){
      if(e.code=="user-not-found"){
        print("No user found for that email");
      }
    }

    return user;
  }
  @override
  Widget build(BuildContext context) {
    //Create the textfield controller
    TextEditingController _emailController= TextEditingController();
    TextEditingController _passwordController= TextEditingController();

    return Padding(
      padding:EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MyApp Title",
            style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight:FontWeight.bold,
            ),
          ),
          Text(
            "Login to your App",
            style: TextStyle(
              color: Colors.black,
              fontSize: 44.0,
              fontWeight:FontWeight.bold,
          ),
          ),
          SizedBox(height: 44.0,),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "User Email",
              prefixIcon: Icon(Icons.mail, color: Colors.black,),
            ),
          ),
          SizedBox(height: 26.0,),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "User Password",
              prefixIcon: Icon(Icons.lock, color: Colors.black,),
            ),
          ),
          SizedBox(height: 12.0,),
          Text("Don't Remember your Password?",
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(height: 88.0,),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              child: Text("Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              fillColor: Color(0xFF0089FE),
              elevation: 0.0,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)
              ),
              onPressed: ()async{
                User? user=await loginUsingEmailPassword(email: _emailController.text.trim(), password: _passwordController.text.trim(), context: context);
                if(user!=null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>EstadoAppTab()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
