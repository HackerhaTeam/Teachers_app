// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/DI/service_locator.dart';
import 'package:teacher_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:teacher_hackerha/core/themes/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/sessions_screen/pages/sessions_page.dart';

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
        home: const SessionsPage()

      ),
    );
  }
}
