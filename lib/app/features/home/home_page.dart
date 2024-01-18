import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jedzenie_jedynaka/app/cubit/app_root_cubit.dart';
import 'package:jedzenie_jedynaka/app/features/home/add/page/add_page_content.dart';
import 'package:jedzenie_jedynaka/app/features/home/dish_list/page/dish_list_page_content.dart';
import 'package:jedzenie_jedynaka/app/features/home/my_account/my_account_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        leading: const Icon(Icons.dining, size: 50),
        title: const Text('Jedyne Przepisy'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AppRootCubit>().signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _index,
        height: 55,
        backgroundColor: Colors.white,
        color: Colors.black12,
        buttonBackgroundColor: Colors.pink,
        items: const [
          Icon(
            Icons.list,
            size: 30,
            color: Colors.black54,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.black54,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.black54,
          ),
        ],
        onTap: (currentIndex) {
          setState(() {
            _index = currentIndex;
          });
        },
      ),
      body: Builder(
        builder: (context) {
          if (_index == 0) {
            return const DishListPageContent();
          }
          if (_index == 1) {
            return AddPageContent(onSave: () {
              setState(() {
                _index = 0;
              });
            });
          }
          return MyAccountPageContent(email: widget.email);
        },
      ),
    );
  }
}
