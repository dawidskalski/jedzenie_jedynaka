import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jedzenie_jedynaka/app/cubit/app_root_cubit.dart';

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
  var isCreatingButton = false;
  var remindPassword = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppRootCubit(),
      child: BlocListener<AppRootCubit, AppRootState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Row(
                  children: [
                    Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    Text('Something went wrong')
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AppRootCubit, AppRootState>(
          builder: (context, state) {
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
                          Colors.pink.shade900,
                          Colors.purple.shade700,
                          Colors.purple.shade500,
                          Colors.purple.shade400,
                          Colors.pink.shade300,
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
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
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
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
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
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () async {
                                if (isCreatingButton == false) {
                                  context.read<AppRootCubit>().signIn(
                                      email: widget.emailController.text,
                                      password: widget.passwordController.text);
                                }
                                if (isCreatingButton == true) {
                                  context.read<AppRootCubit>().createAccount(
                                      email: widget.emailController.text,
                                      password: widget.passwordController.text);
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
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                context.read<AppRootCubit>().remindPassword(
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
          },
        ),
      ),
    );
  }
}
