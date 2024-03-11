import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jedzenie_jedynaka/app/cubit/app_root_cubit.dart';
import 'package:jedzenie_jedynaka/app/domain/repositories/user_repository.dart';
import 'package:jedzenie_jedynaka/app/features/home/home_page.dart';

import 'package:jedzenie_jedynaka/app/features/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          useMaterial3: true,
        ),
        home: const RootPage());
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppRootCubit(UserRepository())..start(),
      child: BlocBuilder<AppRootCubit, AppRootState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          }
          return HomePage(email: user.user.email!);
        },
      ),
    );
  }
}
