import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

List<Photos> photolist = [];
Future<List<Photos>> getPhotoApi() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    photolist.clear();
    for (Map<String, dynamic> i in data) {
      Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
      photolist.add(photos);
    }
    return photolist;
  } else {
    return photolist;
  }
}

class _MyWidgetState extends State<MyWidget> {
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
            //  flex: 2,
            child: FutureBuilder(
                future: getPhotoApi(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                  // if (!snapshot.hasData) {
                  //   return const Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // }
                  return ListView.builder(
                      itemCount: photolist.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].url.toString()),
                          ),
                          subtitle:
                              Text(snapshot.data![index].title.toString()),
                          title: Text(
                              "Notes id :${snapshot.data![index].id.toString()}"),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  int id;

  Photos({required this.title, required this.url, required this.id});
}
