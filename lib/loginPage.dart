import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
void main() {
  debugShowCheckModeBanner:false;
}
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);
  @override
  State<loginPage> createState() => _loginPageState();
}
class _loginPageState extends State<loginPage> {
  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance.
      createUserWithEmailAndPassword(
          email: _email,
          password:_password,
      );
      print('User: $userCredential');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    }
  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance.
      signInWithEmailAndPassword(
        email: _email,
        password:_password,
      );
      print('User: $userCredential');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
    late String _email;
    late String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text
          ('Login page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height:50 ,
            width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child:TextFormField(
                onChanged: (value){
                  _email=value;
                },
                decoration: const InputDecoration(
                  prefixIcon:  Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
              const SizedBox(height: 20,),
      Container(
        height:50 ,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
           child: TextFormField(
                onChanged: (value){
                  _password=value;
                },
                decoration: const InputDecoration(
                  prefixIcon:  Icon(Icons.lock),
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
          const SizedBox(height: 30,),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
              MaterialButton(
                color: const Color.fromARGB(231, 7, 63, 30),
                highlightColor: Colors.red,
                onPressed:_login,
                child: const Text('Login',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                ),
                ),
              ),
                const SizedBox(width: 20,),
                MaterialButton(
                  color: const Color.fromARGB(231, 7, 63, 30),
                  highlightColor: Colors.red,
                  onPressed:_createUser,
                  child: const Text('Create New Account',
                    style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],),
        ],
      ),
    );
  }
}
