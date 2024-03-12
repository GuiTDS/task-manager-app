import 'package:flutter/material.dart';
import 'package:task_management_app/pages/profile_page.dart';
import 'package:task_management_app/pages/task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int actualPage = 0;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: actualPage);
  }

  setActualPage(int page) {
    setState(() {
      actualPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          TaskPage(),
          ProfilePage(),
        ],
        onPageChanged: (page) => setActualPage(page),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: actualPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.align_vertical_bottom),
            label: '',
          ),
        ],
        onTap: (value) => pageController.animateToPage(
          value,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
      ),
    );
  }
}
