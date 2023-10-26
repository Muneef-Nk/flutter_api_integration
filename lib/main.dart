import 'package:api_integration/controller/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmployeeController())
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
