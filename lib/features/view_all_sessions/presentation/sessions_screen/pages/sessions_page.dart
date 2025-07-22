import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/sessions_screen/manager/sessions_list_cubit/sessions_list_cubit.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/sessions_screen/widgets/sessions_content.dart';

class SessionsPage extends StatelessWidget {
  const SessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SessionsListCubit(items: items),
      child: SafeArea(child: Scaffold(body: SessionsContent())),
    );
  }
}

List<Map<String, dynamic>> items = [
  {
    'type': 'lesson',
    'title': 'مدخل إلى البرمجة',
    'subTitle': '09:00',
    'numberOfSessions': '01',
  },
  {
    'type': 'lesson',
    'title': 'المتغيرات وأنواع البيانات',
    'subTitle': '10:30',
    'numberOfSessions': '02',
  },
  {'type': 'exam', 'title': 'اختبار أولي', 'subTitle': '12:00'},
  {
    'type': 'lesson',
    'title': 'الشروط والمنطق',
    'subTitle': '01:15',
    'numberOfSessions': '03',
  },
  {'type': 'exam', 'title': 'اختبار منتصف المساق', 'subTitle': '02:00'},
  {
    'type': 'lesson',
    'title': 'الحلقات التكرارية',
    'subTitle': '03:00',
    'numberOfSessions': '04',
  },
  {
    'type': 'lesson',
    'title': 'الدوال والتجريد',
    'subTitle': '04:30',
    'numberOfSessions': '05',
  },
  {'type': 'exam', 'title': 'اختبار قصير', 'subTitle': '06:00'},
  {
    'type': 'lesson',
    'title': 'المصفوفات والقوائم',
    'subTitle': '07:15',
    'numberOfSessions': '06',
  },
  {'type': 'exam', 'title': 'الاختبار النهائي', 'subTitle': '08:30'},
];
