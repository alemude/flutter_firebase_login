import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
void main() {
  debugShowCheckModeBanner:false;
}
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}
class _homePageState extends State<homePage> {
  String val = 'Hover';
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        backgroundColor: Colors.white30,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text
            ('Home page'),
          centerTitle: true,
          leading: GestureDetector(
            child: const Icon(Icons.menu),
            ),
          ),
        body: Column(
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
  Container(
    alignment: Alignment.center,
    height: 30,
    width: 80,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child:  Row(
      children: [
        InkWell(
          onTap:(){
            print('hello');
          },
          child: Row(
            children: const [
              Text('Decision',

                style: TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 11,

                ),

              ),
              Icon(Icons.done_outline,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    ),
  ),
  Container(
    alignment: Alignment.center,
    height: 30,
    width: 80,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child:  Row(
      children: [
        InkWell(
          onTap:(){
            print('hello');
          },
          child: Row(
            children: const [
              Text('Appoint',

                style: TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 11,

                ),

              ),
              Icon(Icons.timer,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    ),
  ),
  Container(
    alignment: Alignment.center,
    height: 30,
    width: 80,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child:  Row(
      children: [
        InkWell(
          onTap:(){
            print('hello');
          },
          child: Row(
            children: const [
              Text('Info',

                style: TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 11,

                ),

              ),
              Icon(Icons.upcoming_outlined,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    ),
  ),
  Container(
    alignment: Alignment.center,
    height: 30,
    width: 80,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
    child:  Row(
      children: [
        InkWell(
          onTap:(){
            print('hello');
          },
          child: Row(
            children: const [
              Text('Help',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
              Icon(Icons.handshake,
                color: Colors.black,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    ),
  ),
],
            ),
            SizedBox(height: 30,),
            Container(
              height:200,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(image: AssetImage('assets/images/2.jpg'),
               fit: BoxFit.cover,
                ),
              ),
              
            ),
           const SizedBox(height: 30,),
            MaterialButton(
              color: const Color.fromARGB(231, 7, 63, 30),
              highlightColor: Colors.red,
              onPressed: ()async{
                await FirebaseAuth.instance.signOut();
              },
              child: const Text('sign Out',
                style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
