import 'dart:convert';

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
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    } else {
      return userlist;
    }
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
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: userlist.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ReusableRow(
                                      title: "name",
                                      value:
                                          snapshot.data![index].name.toString(),
                                    ),
                                    ReusableRow(
                                      title: "username",
                                      value: snapshot.data![index].username
                                          .toString(),
                                    ),
                                    ReusableRow(
                                      title: "email",
                                      value: snapshot.data![index].email
                                          .toString(),
                                    ),
                                    ReusableRow(
                                      title: "Address",
                                      value: snapshot
                                              .data![index].address!.city
                                              .toString() +
                                          snapshot
                                              .data![index].address!.geo!.lat
                                              .toString() +
                                          snapshot
                                              .data![index].address!.geo!.lng
                                              .toString(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
