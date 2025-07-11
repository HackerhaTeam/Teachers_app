//-----------------------------
// Widget: CourseInformationBody
//-----------------------------

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/core/widgets/rounded_square_icon.dart';
import 'package:teacher_hackerha/features/course%20detiles/presentation/widgets/Course%20informations/course_info_price.dart';
import 'package:teacher_hackerha/features/course%20detiles/presentation/widgets/Course%20informations/floating_active_course_button.dart';


class BottomSheetPrice extends StatelessWidget {
  const BottomSheetPrice({
    super.key,
   
  });

  

  @override
  Widget build(BuildContext context) {
     final content = Theme.of(context).extension<AppContent>()!;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    return CustomCard(
    borderColor:border.transparent ,
        width: double.infinity,
        height: 90,
        backgroundColor: background.surfacePrimary,
        child: Row(
          children: [
            SizedBox(width: 20.w(context),),
            RoundedSquareIcon(
              icon: PhosphorIcons.shoppingCartSimple(),
              color: background.onSurfaceSecondary,
              gradient: LinearGradient(colors: [border.transparent]),
              iconColor: content.primary,
            ),
            Padding(
              padding:  EdgeInsets.only(top:22,bottom: 22,right: 8.w(context) ),
              child: CourseInfoPriceView(content: content,),
            ),SizedBox(width:20.w(context) ,
            ),Padding(
              padding: const EdgeInsets.only(top:16 ),
              child: ActiveCourseButton(width:184.w(context) ,),
            )
          ],
        ),
      );
  }
}
