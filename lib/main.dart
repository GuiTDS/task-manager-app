import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/pages/task_page.dart';
import 'package:task_management_app/repositories/task_repository.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => TaskRepository(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        fontFamily: 'Poppins',
      ),
      routes: {
        '/taskPage': (context) => const TaskPage(),
      },
      initialRoute: '/taskPage',
    );
  }
}
