import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'login_page.dart';

import '../screens/home_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _name = '', _password1 = '', _password2 = '';
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Register',
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
                      _password1 = val;
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
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: false,
                    style: const TextStyle(letterSpacing: 1.2),
                    onChanged: (val) {
                      _password2 = val;
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "enter valid password";
                      }
                      if (_password2 != _password1) {
                        return "passwords not matched";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Confirm password",
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)))),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                      child: const Text(
                        "     Register    ",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.blueGrey)),
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _password1 == _password2) {
                          GetStorage box = GetStorage();
                          box.write('name', _name.toLowerCase());
                          box.write('pass', _password1);
                          Get.offAll(const LoginPage());
                        }
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        child: const Text(
                          "     already registered ?  ",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          Get.offAll(const LoginPage());
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
