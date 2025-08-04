import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/courses/presentation/widgets/courses_tab_page_body.dart';
import 'package:teacher_hackerha/features/home/presentation/manager/change%20icon%20cubit/change_icon_cubit.dart';
import 'package:teacher_hackerha/features/home/presentation/pages/account_tab_page.dart';
import 'package:teacher_hackerha/features/home/presentation/pages/home_page_.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/drawer/my_drawer.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/navbar/animated_navbar.dart';
import 'package:teacher_hackerha/features/questions/presentation/pages/question_page.dart';
import 'package:teacher_hackerha/features/questions/presentation/widget/question_page_body.dart';
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

 late ChangeIconCubit _iconCubit;


  @override
  void initState() {

 _iconCubit = ChangeIconCubit()..initController(this);

    

    _pages = [
      HomePage(),
      HomePage(),
      CoursesTabPageBody(),
      AccountTabPage()
     
      
    ];
        super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();    
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _iconCubit,
      child: QuestionPage(),
      // child: ThemeSwitchingArea(
      //   child: Scaffold(
      //         onDrawerChanged: (isOpened) {
             

      //       },
      //     drawer: MyDrawer(
      //           animationController: _iconCubit.controller,
      //           onThemeChanged: () {
      //             if (_scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      //               _scaffoldKey.currentState?.openEndDrawer();
      //             }
      //           },
      //         ),
            
      //         key: _scaffoldKey,
            
      //         body: PageView(
      //           controller: _pageController,
      //           physics: const ClampingScrollPhysics(),
      //           children: _pages,
      //           onPageChanged: (index) {
      //             setState(() {
      //               _currentIndex = index;
      //             });
      //           },
      //         ),
      //         bottomNavigationBar: AnimatedBottomNavBar(
      //           currentIndex: _currentIndex,
      //           onTap: (newIndex) {
      //             setState(() {
      //               _currentIndex = newIndex;
      //             });
      //             _pageController.jumpToPage(newIndex);
      //           },
      //         ),
      //       ),
      // ),
    );
  }
}
