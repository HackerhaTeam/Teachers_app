import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/constants/assets_image.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_content.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/manager/cubit/image_upload_cubit.dart';

Widget buildContentByState(ImageUploadState state, BuildContext context) {
  if (state is ImageUploadLoading) {
    final content = Theme.of(context).extension<AppContent>()!;
    return Row(
      children: [
        Text("جاري التحميل", style: context.xParagraphLargeNormal),
        Spacer(),
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: content.primary,
          ),
        ),
      ],
    );
  } else if (state is ImageUploadSuccess) {
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
    final filePath = state.file.path.split('/').last;

    return Row(
      children: [
        CustomCircleIcon(
          backgroundColor: bgColor.primaryBrand,
          circleSize: 24.s(context),
          iconAsset: AppImages.imageIcon,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            width: 45, // العرض المطلوب للنص
            child: Text(
              filePath,
              style: context.xParagraphLargeNormal,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            context.read<ImageUploadCubit>().removeImage();
          },
          child: PhosphorIcon(PhosphorIcons.x()),
        ),
      ],
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PhosphorIcon(PhosphorIcons.uploadSimple()),
        SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Text(
              "انقر هنا لرفع الصورة",
              style: context.xParagraphLargeNormal.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            Text("استخدم صيغة PNG أو JPEG ", style: context.xParagraphSmall),
            Text(
              "(حجم الصورة 800KB على الأكثر).",
              style: context.xParagraphSmall,
            ),
          ],
        ),
      ],
    );
  }
}
