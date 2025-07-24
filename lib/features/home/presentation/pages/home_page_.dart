import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/home/presentation/manager/change%20icon%20cubit/change_icon_cubit.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
      var scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(create: (BuildContext context) { 
      return ChangeIconCubit()..initController(this);
     },
    child: HomePageBody(key: scaffoldKey,));
  }
}
