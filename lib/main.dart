// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/DI/service_locator.dart';
import 'package:teacher_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:teacher_hackerha/core/themes/app_theme.dart';
import 'package:teacher_hackerha/features/auth/presentation/pages/log_in_pages/log_in_page.dart';
import 'package:teacher_hackerha/features/auth/presentation/pages/sign_up_pages/sign_up_wrapper.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/navbar/main_navigation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TagCubit(),
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: Locale('ar'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [const Locale('ar', ''), const Locale('en', '')],
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: const LogInPage(),
      ),
    );
  }
}
