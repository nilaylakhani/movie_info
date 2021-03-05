import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_info/controller/moviecontroller.dart';
import 'package:get/instance_manager.dart';
import 'package:movie_info/utilities/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MovieController movieController = Get.put(MovieController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
