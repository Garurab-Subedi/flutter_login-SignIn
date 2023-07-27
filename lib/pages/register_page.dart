import 'package:flutter/material.dart';

import '../utils/routes.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {FocusScope.of(context).unfocus()},
        child: Scaffold(
            body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Image.asset("assets/images/logo1.png", fit: BoxFit.cover),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Register $name",
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
                          labelText: 'Username',
                          hintText: 'Enter Username',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Useremail",
                          labelText: "Useremail",
                        ),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        onTap: () async {
                          setState(() {
                            changeButton = true;
                          });

                          await Future.delayed(const Duration(seconds: 1));
                          await Navigator.pushNamed(
                              context, MyRoutes.loginRoute);

                          setState(() {
                            changeButton = false;
                          });
                        },
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
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
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
        )));
  }
}
