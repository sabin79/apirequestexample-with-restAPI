import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:restapi/models/user_model.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserApiPage extends StatefulWidget {
  const UserApiPage({super.key});

  @override
  State<UserApiPage> createState() => _UserApiPageState();
}

class _UserApiPageState extends State<UserApiPage> {
List<UserModel> userlist = [];

Future<List><UserModel> getuserApi() async {
  final respone = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Api Call with Rest API"),
        backgroundColor: Colors.blueAccent.shade100,
        centerTitle: true,
        elevation: 0.0,

      ),
      body: ,
    );
  }
}