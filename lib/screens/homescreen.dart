import 'package:flutter/material.dart';
import 'package:my_app3/services/remote_services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/model.dart';
import 'detailed_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<User>?> users;
  var isLoaded = false;

  @override
  void initState() {
    users = HttpService().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Users'),
      ),
      body: FutureBuilder(
        future: users,
        builder: (context, snapshot) { 
          if (snapshot.hasData) {
             List<User> user = snapshot.data!;
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyWidget(user: user[index]);
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey[400],
                      ),
                      height: 80,
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        snapshot.data![index].title ?? '',
                        style: GoogleFonts.lato(fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
