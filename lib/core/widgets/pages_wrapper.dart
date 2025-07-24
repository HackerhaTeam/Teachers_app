import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/widgets/headers/custom_pages_header.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/pages/new_quistion_pages/new_quistion_page1.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/pages/new_quistion_pages/new_quistion_page2.dart';
import 'package:teacher_hackerha/features/auth/presentation/pages/sign_up_pages/sign_up_page1.dart';
import 'package:teacher_hackerha/features/auth/presentation/pages/sign_up_pages/sign_up_page2.dart';
import 'package:teacher_hackerha/features/auth/presentation/pages/sign_up_pages/sign_up_page3.dart';
import 'package:teacher_hackerha/features/auth/presentation/pages/sign_up_pages/verification_page.dart';

class PagesWrapper extends StatefulWidget {
  const PagesWrapper({super.key, required this.isAuth});
  final bool isAuth;
  @override
  State<PagesWrapper> createState() => _PagesWrapperState();
}

class _PagesWrapperState extends State<PagesWrapper> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<Widget> get _pages {
    if (widget.isAuth) {
      return [
        SignUpPage1(onNext: _goToNextPage),
        SignUpPage2(onNext: _goToNextPage),
        SignUpPage3(onNext: _goToNextPage),
        const VerificationPage(isSignIn: false),
      ];
    } else {
      return [
        NewQuistionPage1(onNext: _goToNextPage),
        NewQuistionPage2(onNext: _goToNextPage),
      ];
    }
  }

  int get _totalPages => _pages.length;
  double get _progress => (_currentPage + 1) / _totalPages;

  void _goToNextPage() {
    if (_currentPage < _totalPages - 1 && _pages.isNotEmpty) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;

    return Scaffold(
      backgroundColor: backgrounds.surfacePrimary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h(context)),
            CustomPagesHeader(
              progress: _progress,

              onBack: _goToPreviousPage,
              currentPage: _currentPage,
              isAuth: widget.isAuth,
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
