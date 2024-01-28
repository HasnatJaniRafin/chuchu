import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  static const routeName = '/me';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Me'),
      ),
      body: Center(
        child: Text('Me Page Content'),
      ),
    );
  }
}
