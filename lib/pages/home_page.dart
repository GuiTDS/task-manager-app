import 'package:flutter/material.dart';
import 'package:task_management_app/pages/task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int actualPage = 0;
  late PageController pageController;

  @override
  void initState() {
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
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          TaskPage(),
        ],
        onPageChanged: (page) {
          if (page != actualPage) {
            setActualPage(page);
          }
        },
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
        onTap: (value) {
          if (value != actualPage) {
            pageController.jumpToPage(
              value,
            );
          }
        },
      ),
    );
  }
}
