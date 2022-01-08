import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'register_page.dart';

import '../screens/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _name = '', _password = '';
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        child: Center(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
            // decoration:  BoxDecoration(
            //   // borderRadius:const BorderRadius.only(bottomRight: Radius.circular(8.0)),
            //   border: Border(
            //     bottom: BorderSide(width: 5.0,color: Colors.blueGrey),
            //     right: BorderSide(width: 5.0,color: Colors.blueGrey),
            //   )
            // ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Sign In',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    obscureText: false,
                    style: const TextStyle(letterSpacing: 1.2),
                    onChanged: (val) {
                      _name = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "enter your name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Your name",
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)))),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: false,
                    style: const TextStyle(letterSpacing: 1.2),
                    onChanged: (val) {
                      _password = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "enter valid password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Password",
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)))),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextButton(
                      child: const Text(
                        "     sign in    ",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.blueGrey)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          GetStorage box = GetStorage();
                          String _saveName = box.read('name') ?? '';
                          String _savePass = box.read('pass') ?? '';
                          if (_name.toString().toLowerCase() == _saveName &&
                              _password == _savePass) {
                            Get.offAll(const HomePage());
                          } else {
                            Get.snackbar('Login Error',
                                'Invalid login name or password');
                          }
                        }
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        child: const Text(
                          "     new user ?  ",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          Get.to(const RegisterPage());
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
