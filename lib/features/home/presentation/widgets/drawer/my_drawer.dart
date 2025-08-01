import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/features/home/presentation/manager/change%20icon%20cubit/change_icon_cubit.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/drawer/drawer_headding.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/drawer/menu_list.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/drawer/user_profile.dart';

import '../../../../../core/widgets/gradient_divider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
    required this.animationController,
    this.onThemeChanged,
  });
  final AnimationController animationController;
  final VoidCallback? onThemeChanged;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isClosed = false;

  @override
  void initState() {
    _animationController = widget.animationController;
    iconTaped();
    super.initState();
  }

  bool isopen = false;
  void iconTaped() {
    if (!isopen) {
      _animationController.forward();
      isopen = true;
    } else {
      _animationController.reverse();
      isopen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>();

    return SafeArea(
      child: Drawer(
          backgroundColor: backgroundColor!.surfacePrimary,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h(context)),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h(context),
                ),
                DrawerHeadding(animationController: context.read<ChangeIconCubit>().controller,
                  onClose: () {
                    Navigator.of(context).pop();
             
                  },
                ),
                SizedBox(
                  height: 20.h(context),
                ),
                UserProfile(
                  userName: "محمد المحمد",
                ),
                SizedBox(
                  height: 24.h(context),
                ),
                GradientDivider(),
                SizedBox(
                  height: 24.h(context),
                ),
                MenuList(),
              ],
            ),
          )),
    );
  }
}