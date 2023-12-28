import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingButton = false;
  var remindPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // first container
          Container(
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.purple.shade900,
                  Colors.purple.shade700,
                  Colors.purple.shade500,
                  Colors.purple.shade400,
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (remindPassword == false) ...[
                  if (isCreatingButton == false) ...[
                    const Text(
                      "Zaloguj się ",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  if (isCreatingButton == true) ...[
                    const Text(
                      "Zarejestruj się ",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  if (isCreatingButton == false) ...[
                    Row(
                      children: [
                        const Text(
                          'Nie masz jeszcze konta?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isCreatingButton = true;
                            });
                          },
                          child: const Text(
                            'Zarejestruj się',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ],
                  if (isCreatingButton == true) ...[
                    Row(
                      children: [
                        const Text(
                          'Mam już konto!',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isCreatingButton = false;
                            });
                          },
                          child: const Text(
                            'Zaloguj się',
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ],
                ],
                if (remindPassword == true) ...[
                  const Text(
                    'Przypomnij hasło',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                    ),
                  )
                ]
              ],
            ),
          ),
          const SizedBox(height: 30),
          // second container
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  if (remindPassword == false) ...[
                    TextField(
                      controller: widget.emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.mail),
                        hintText: 'e-mail',
                        focusColor: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: widget.passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.key),
                        hintText: 'hasło',
                        focusColor: Colors.orange,
                      ),
                      obscureText: true,
                    ),
                    Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (isCreatingButton == false) {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: widget.emailController.text,
                                    password: widget.passwordController.text);
                          } catch (error) {
                            setState(() {
                              errorMessage = error.toString();
                            });
                          }
                        }
                        if (isCreatingButton == true) {
                          try {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: widget.emailController.text,
                                    password: widget.passwordController.text);
                          } catch (error) {
                            setState(() {
                              errorMessage = error.toString();
                            });
                          }
                        }
                        widget.emailController.clear();
                        widget.passwordController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      child: const Text(
                        'Wyślij',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isCreatingButton == false
                              ? 'Nie pamietam hasła? '
                              : 'Mam już konto!',
                          style: const TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              remindPassword = true;
                            });
                          },
                          child: Text(
                            isCreatingButton == false
                                ? 'Przypomnij'
                                : 'Zaloguj się',
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (remindPassword == true) ...[
                    TextField(
                      controller: widget.emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.mail),
                        hintText: 'e-mail',
                        focusColor: Colors.orange,
                      ),
                    ),
                    Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: widget.emailController.text);

                        widget.emailController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      child: const Text(
                        'Zresetuje',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Pamiętam hasło!'),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              remindPassword = false;
                            });
                          },
                          child: const Text('Zaloguj się'),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
