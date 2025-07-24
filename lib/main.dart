// ignore_for_file: deprecated_member_use

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/DI/service_locator.dart';
import 'package:teacher_hackerha/core/api/api_interceptors.dart';
import 'package:teacher_hackerha/core/manager/tag_cubit/tag_cubit.dart';
import 'package:teacher_hackerha/core/manager/theme_cubit/theme_cubit.dart';
import 'package:teacher_hackerha/core/themes/app_theme.dart';
import 'package:teacher_hackerha/features/home/data/repositories/top_teacher_repsioties_impl.dart';
import 'package:teacher_hackerha/features/home/data/source/top_teacher_data_sourse.dart';
import 'package:teacher_hackerha/features/home/domain/usecase/top_teacher_usecase.dart';
import 'package:teacher_hackerha/features/home/presentation/manager/top%20teacher/top_teacher_cubit.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/navbar/main_navigation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
    Dio dio = Dio();
    dio.interceptors.add(ApiInterceptor());
  setupDependencies();

    
  runApp(
    
    MultiBlocProvider(providers: [ 
      BlocProvider(create: (context) => TagCubit()),
      BlocProvider(create: (context) => ThemeCubit()),
      BlocProvider(
      create: (context) => TopTeacherCubit(TopTeacherUsecase(TopTeacherRepsiotiesImpl(TopTeacherDataSourse(dio))),
    
      
    )..getTopTeacher()
  )], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1)),
          child: ThemeProvider(
            duration: Duration(milliseconds: 300),
            initTheme: AppTheme.light,
            builder: (_, myTheme) {
              return MaterialApp(
                useInheritedMediaQuery: true,
                locale: Locale('ar'),
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('ar', ''),
                  const Locale('en', ''),
                ],
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                home: MainNavigationPage(),
              );
            },
          ),
        );
      },
    );
  }
}
