import 'package:flutter/material.dart';
import 'package:flutter_contactapp/pages.dart/new_contact_page.dart';

class ContatctHomePage extends StatelessWidget {
  static const String routeName = '/';
  const ContatctHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact App'),
        centerTitle: true,
      ),
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>Navigator.pushNamed(context,NewContactPage.routeName ),
        child: const Icon(Icons.add),
       ),
    );
  }
}
