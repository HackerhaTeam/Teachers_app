import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/functions/navigation.dart';
import 'package:teacher_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/pages/add_new_quiz_page.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/dialog/show_quistion_dialog.dart';

class CustomPagesHeader extends StatelessWidget {
  const CustomPagesHeader({
    super.key,
    required double progress,

    required this.onBack,
    required this.currentPage,
    required this.isAuth,
  }) : _progress = progress;

  final double _progress;

  final int currentPage;
  final VoidCallback onBack;
  final bool isAuth;
  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final primaryColor = backgrounds.primaryBrand;
    String headerText = "";
    if (isAuth) {
      if (currentPage == 0) {
        headerText = "توضيح هام";
      } else if (currentPage == 1) {
        headerText = "المعلومات والبيانات الشخصية";
      } else if (currentPage == 2) {
        headerText = "المعلومات والبيانات الجامعية";
      } else if (currentPage == 3) {
        headerText = "لضمان تجربة مخصصة مناسبة";
      } else if (currentPage == 4) {
        headerText = "سجل دخولك عبر بريدك الإلكتروني فقط";
      } else if (currentPage == 5) {
        headerText = "حماية وأمان حسابك";
      }
    } else {
      if (currentPage == 0 || currentPage == 1) {
        headerText = "إعدادات السؤال";
      } else if (currentPage == 2) {
        headerText = "محتوى السؤال";
      } else if (currentPage == 3) {
        headerText = "إعداد خيارات الإجابة";
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20.w(context)),
        HeaderIconButton(
          onTap: () {
            onBack();
            FocusScope.of(context).unfocus();
          },
          iconDark: AppImages.carretRightDark,
          iconLight: AppImages.carretRightLight,
        ),
        SizedBox(width: 28.w(context)),
        Center(
          child: Column(
            children: [
              Text(headerText, style: context.xLabelSmall),
              SizedBox(height: 8.r(context)),
              SizedBox(
                width: 228.w(context),
                child: Stack(
                  children: [
                    Container(
                      decoration: containerDecoration(
                        context,
                        Colors.grey[300],
                      ),
                      height: 6.h(context),
                      width: double.infinity,
                    ), // primaryColor
                    AnimatedContainer(
                      decoration: containerDecoration(context, primaryColor),
                      duration: const Duration(milliseconds: 300),
                      height: 6.h(context),
                      width: 228.w(context) * _progress,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 28.w(context)),
        if (isAuth == false)
          HeaderIconButton(
            onTap: () {
              showQuistionDialog(
                context: context,
                onLeftPressed: () {
                  context.navigateWithSlideTransition(NewQuizPage());
                },
              );
            },
            iconDark: AppImages.xDark,
            iconLight: AppImages.xLight,
          ),
      ],
    );
  }

  BoxDecoration containerDecoration(BuildContext context, Color? color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(40.r(context)),
    );
  }
}

class HeaderIconButton extends StatelessWidget {
  const HeaderIconButton({
    super.key,
    required this.onTap,
    required this.iconDark,
    required this.iconLight,
  });

  final VoidCallback onTap;
  final String iconDark;
  final String iconLight;
  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return Padding(
      padding: EdgeInsets.only(top: 7),
      child: CustomCircleIcon(
        circleSize: 44.s(context),
        backgroundColor: backgrounds.onSurfaceSecondary,
        onTap: () {
          onTap();
        },
        iconAsset: getThemeIcon(context, iconDark, iconLight),
        iconSize: 24.s(context),
      ),
    );
  }
}
