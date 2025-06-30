
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void navigateFromBottom(Widget page) {
    Navigator.of(this).push(
      PageRouteBuilder(
        opaque: false, 
        barrierColor: Colors.black.withOpacity(0.3),
        pageBuilder: (_, __, ___) => Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            child: SizedBox(
              height: MediaQuery.of(this).size.height * 0.6,
              child: page,
            ),
          ),
        ),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: child,
          );
        },
      ),
    );
  }

  void navigationWithFade(Widget page) {
    Navigator.of(this).push(
      PageRouteBuilder(
        opaque: false, 
        barrierColor: Colors.black.withOpacity(0.3),
        pageBuilder: (_, __, ___) => Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            child: SizedBox(
                child: page,
              ),
          ),
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  void navigateWithSlideTransition(Widget page) {
    Navigator.push(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
