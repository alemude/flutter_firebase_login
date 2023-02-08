import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'loginPage.dart';
import 'homePage.dart';
void main() {
  runApp(const MyApp());
}
  class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner:false,
    home: landingPage(),
  );
  }
  }
class landingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
       future: _initialization,
        builder: (context, snapshot){
         if(snapshot.hasError){
           return Scaffold(
             body: Center(
               child: Text('Error ${snapshot.error}'),
             ),
           );
         }
if(snapshot.connectionState== ConnectionState.done){
  return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder:(context,snapshot){
        if(snapshot.connectionState==ConnectionState.active){
         User? user =snapshot.data;
          if(user==null){
            return const loginPage();
          }
          else{
            return const homePage();
          }
        }
        return const Scaffold(
          body: Center(
            child: Text("Cheacking the Authentication."),
          ),
        );
      }
  );
}
         return const Scaffold(
           body: Center(
             child: Text("Connecring to the App"),
           ),
         );
  }
    );
  }
}
//https://firebase.flutter.dev/docs/auth/usage/
//Flutter - Firebase Login - Part 3
