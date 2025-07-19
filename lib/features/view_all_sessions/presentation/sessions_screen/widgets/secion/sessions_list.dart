import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/list_tile_card.dart';
import 'package:teacher_hackerha/features/sessions/presentation/sessions_screen/manager/sessions_list_cubit/sessions_list_cubit.dart';
import 'package:teacher_hackerha/features/sessions/presentation/sessions_screen/manager/sessions_list_cubit/sessions_list_state.dart';

class SessionsList extends StatelessWidget {
  const SessionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return BlocBuilder<SessionsListCubit, SessionsListState>(
      builder: (context, state) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final childWidget =
                state.items[index]['type'] == 'exam'
                    ? PhosphorIcon(
                      size: 16.s(context),
                      PhosphorIcons.exam(),
                      color: contentColor.primaryInverted,
                    )
                    : Text(
                      state.items[index]['numberOfSessions'],
                      style: context.xLabelSmall.copyWith(
                        color: contentColor.primaryInverted,
                      ),
                    );

            return Padding(
              padding: EdgeInsets.only(bottom: 8.h(context)),
              child: ListTileCard(
                childOfRoundedSquareShape: childWidget,
                index: index,
                title: state.items[index]['title'],
                subTitle: state.items[index]['subTitle'],
                circleIconAsset:
                    state.items[index]['type'] == 'exam'
                        ? AppImages.studentFill
                        : AppImages.playFill,
              ),
            );
          },
        );
      },
    );
  }
}
