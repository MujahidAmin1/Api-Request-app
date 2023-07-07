import 'package:flutter/material.dart';
import 'package:my_app3/models/model.dart';

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  User? user;
  MyWidget({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yokozo"),
      ),
      body: Column(
        children: [
          Text('${user!.id}'),
          const SizedBox(height: 10,),
          Text('${user!.body}')
        ],
      ),
    );
  }
}
