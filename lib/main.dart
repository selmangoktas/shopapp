import 'package:flutter/material.dart';
import 'package:shopapp/controllers/card.dart';
import 'package:shopapp/views/pagecontroller.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var c = Get.put(CartControllers()); //CartControllers.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageControllerView(),
    );
  }
}
