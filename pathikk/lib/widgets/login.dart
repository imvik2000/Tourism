import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pathikk/home/newhome.dart';

const storage = FlutterSecureStorage();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "", password = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    setState(() {
      changebutton = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Image.asset(
              'PATHIK.png',
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Welcome $email"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  // email field
                  TextFormField(
                      decoration: const InputDecoration(hintText: "User Email"),
                      onChanged: (value) {
                        email = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "cant be empty";
                        }
                        return null;
                      }),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Password"),
                    onChanged: (value) {
                      password = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const home2()));
                      //login(email, password);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changebutton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changebutton
                          ? const Icon(Icons.done, color: Colors.white)
                          : const Text("Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changebutton ? 50 : 8)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

Future<http.Response> login(String email, String password) {
  return http
      .post(
    Uri.parse('http://localhost:8000/api/api-token-auth/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //'Authorization': 'token d05e992e55138f5096905c33f2c64e69617a44c3'*
    },
    body: jsonEncode(<String, String>{
      'username': email,
      'password': password,
    }),
  )
      .then((http.Response response) async {
    //print(jsonDecode(response.body)['token']);

    await storage.write(
        key: 'token', value: jsonDecode(response.body)['token']);
    print(await storage.read(key: 'token'));
    return response;
  });
}
