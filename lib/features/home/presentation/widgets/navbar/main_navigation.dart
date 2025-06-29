import 'package:flutter/material.dart';
import 'package:teacher_hackerha/features/courses/presentation/widgets/courses_tab_page_body.dart';
import 'package:teacher_hackerha/features/home/presentation/pages/home_page_.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/navbar/animated_navbar.dart';
class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  late List<Widget> _pages;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  void initState() {
    super.initState();

    

    _pages = [
      HomePage(),
      HomePage(),
      CoursesTabPageBody(),
      HomePage(),
      HomePage(),
      
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          key: _scaffoldKey,
        
          body: PageView(
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          bottomNavigationBar: AnimatedBottomNavBar(
            currentIndex: _currentIndex,
            onTap: (newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
              _pageController.jumpToPage(newIndex);
            },
          ),
        );
  }
}
