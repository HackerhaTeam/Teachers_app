import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:teacher_hackerha/features/sessions/presentation/sessions_screen/manager/sessions_list_cubit/sessions_list_cubit.dart';
import 'package:teacher_hackerha/features/sessions/presentation/sessions_screen/widgets/popup_menue_icon.dart';

class SessionsHeader extends StatelessWidget {
  const SessionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    return Row(
      children: [
        CustomCircleIcon(
          circleSize: 44.s(context),
          iconAsset: AppImages.caretRight,
          iconSize: 24.s(context),
          iconColor: contentColor.primary,
          backgroundColor: bgColor.onSurfaceSecondary,
        ),
        SizedBox(width: 8.w(context)),
        Text('البرمجة (1)', style: context.xHeadingXLarge),
        Spacer(),
        PopupMenueIcon(
          cubit: context.read<SessionsListCubit>(),
        ),
      ],
    );
  }
}
