import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/home/presentation/manager/change%20icon%20cubit/change_icon_cubit.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/home_header.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>with SingleTickerProviderStateMixin {
  
 
  @override
  Widget build(BuildContext context) {
   
    return CustomScrollView(slivers: [SliverToBoxAdapter(child: HomeHeader(),)
      ],);
  }
}