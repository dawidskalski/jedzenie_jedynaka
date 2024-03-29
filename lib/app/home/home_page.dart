import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jedzenie_jedynaka/app/home/add/add_page_content.dart';
import 'package:jedzenie_jedynaka/app/home/dish_list/dish_list_page_content.dart';
import 'package:jedzenie_jedynaka/app/home/my_account/my_account_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

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
              FirebaseAuth.instance.signOut();
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
      body: Builder(builder: (context) {
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
        return MyAccountPageContent(email: widget.user.email);
      }),
    );
  }
}
