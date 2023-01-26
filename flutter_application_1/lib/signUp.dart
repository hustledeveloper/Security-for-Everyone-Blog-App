import 'dart:math';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _sigInFormKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  TextEditingController ad = TextEditingController();
  TextEditingController soyad = TextEditingController();
  TextEditingController eposta = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController sifre1 = TextEditingController();
  TextEditingController sifre2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference makeupRef = _firestore.collection('makeup');
    return Scaffold(
     appBar: AppBar(
          title: Text("Sign Up "),
          actions: <Widget>[
            Row(
              children: <Widget>[
                Image.asset("images/banner.png"),
              ],
            ),
          ],
        ),
      backgroundColor: Color.fromARGB(221, 214, 175, 247),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            padding: EdgeInsets.only(top: 45),
            children: <Widget>[
              TextFormField(
                controller: ad,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Ad",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: "Adınızı giriniz.",
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                controller: soyad,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Soyad",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: "Soyadınızı giriniz.",
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                controller: eposta,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "EPosta",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: "EPosta adresinizi giriniz.",
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                controller: telefon,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Telefon",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: "(555)-123-45-67",
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                controller: sifre1,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Şifre",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: "Şifrenizi giriniz.",
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                controller: sifre2,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: "Şifre",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: "Şifrenizi tekrar giriniz.",
                ),
              ),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                height: 7,
              ),
              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> makeupData = {
                    'kullaniciAdi': ad.text + soyad.text,
                    'sifre': sifre1.text,
                    'eposta': eposta.text
                  };

                  makeupRef.doc(eposta.text).set(makeupData);

                  print(ad.text);
                  print(sifre1.text);

                  Route route = MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  });

                  Navigator.push(context, route);
                },
                child: Text(
                  "Üye Ol",
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.pink),
                  minimumSize: MaterialStateProperty.all(Size(250, 38)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
