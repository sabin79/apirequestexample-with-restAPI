import 'package:flutter/material.dart';
import 'package:restapi/pages/image_api_page.dart';
import 'package:restapi/pages/user_api_page.dart';

import 'pages/post_api_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserApiPage(),
    );
  }
}
