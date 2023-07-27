import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  moverToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);  
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {FocusScope.of(context).unfocus()},
      child: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Image.asset("assets/images/logo1.png", fit: BoxFit.cover),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Wellcome $name",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Enter Useremail",
                            labelText: "Useremail",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Useremail cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Enter password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password must to more than 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Material(
                          child: InkWell(
                            onTap: () => moverToHome(context),
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              width: changeButton ? 60 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  // shape: changeButton
                                  // ? BoxShape.circle
                                  // : BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(
                                      changeButton ? 20 : 10)),
                              child: changeButton
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 21),
                                    ),
                            ),
                          ),
                        ),

                        // ElevatedButton(
                        //     onPressed: () {
                        //
                        //     },
                        //     style: TextButton.styleFrom(
                        //         minimumSize: const Size(120, 40)),
                        //     child: const Text(
                        //       "login",
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.w900, fontSize: 20),
                        //     )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
