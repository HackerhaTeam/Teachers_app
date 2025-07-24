// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/animation/fade_widget.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/features/home/presentation/manager/top%20teacher/top_teacher_cubit.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/shimmer/teacher_shimmer.dart';

Widget buildTopTeachers(TopTeacherState state,BuildContext context,PageController controller ,AppBackgrounds bg,AppBorders border,AppContent content ){ if (state is TopTeacherLoading) {
      return TeacherShimmer(border: border);
    } else if (state is TopTeacherFailure) {
      return Center(child: Text(state.errMessage));
    } else if (state is TopTeacherSucsess) {
      return FadeInWidget(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.8,
              child: PageView.builder(
                controller: controller,
                itemCount: state.teacher.length,  
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:  EdgeInsets.only(left: 8.w(context),right:8.w(context) ,bottom: 8),
                    child: CustomCard(
                      borderRadius: 12.r(context),
                      backgroundColor: bg.onSurfacePrimary,
                      borderColor: border.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 96,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                      color: Colors.black.withAlpha(26),
                                    ),
                                    borderRadius: BorderRadius.circular(48),
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    PhosphorIcon(
                                      PhosphorIcons.user(),
                                      size: 90,
                                    ),
                                    Positioned(
                                      left: -8,
                                      top: 65,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        child: SvgPicture.asset(
                                            AppImages.accounCheck),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(state.teacher[index].name,
                                  style: context.xDisplayMedium),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PhosphorIcon(
                                    PhosphorIcons.medalMilitary(
                                        PhosphorIconsStyle.fill),
                                  ),
                                  SizedBox(height: 4),
                                  Text(" مدرب الشهر ",
                                      style: context.xParagraphMedium),
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(state.teacher[index].reviewsCount.toString()),
                              Text("مراجعة", style: context.xLabelSmall),
                              SizedBox(height: 8),
                              Container(
                                width: 90.w(context),
                                height: 1,
                                color: const Color(0xffE6E6E6),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(state.teacher[index].reviewsCount.toString(), style: context.xDisplaySmall),
                                  PhosphorIcon(
                                    size: 16,
                                    PhosphorIcons.star(PhosphorIconsStyle.fill),
                                    color: content.warning,
                                  ),
                                ],
                              ),
                              Text("التقييم", style: context.xLabelSmall),
                              SizedBox(height: 8),
                              Container(
                                width: 90.w(context),
                                height: 1,
                                color: const Color(0xffE6E6E6),
                              ),
                              SizedBox(height: 8),
                              Text(state.teacher[index].coursesCount.toString(), style: context.xDisplaySmall),
                              Text("دورات", style: context.xLabelSmall),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            SmoothPageIndicator(
              controller: controller,
              count: state.teacher.length,  // تم التعديل هنا أيضًا
              effect: JumpingDotEffect(
                activeDotColor: bg.primaryBrand,
                dotColor: bg.primaryBrand.withOpacity(0.3),
                dotHeight: 9,
                dotWidth: 9.w(context),
                jumpScale: .9,
                verticalOffset: 25,
              ),
            ),
          ],
        ),
      );
    }
   else{ return SizedBox();}
  
}