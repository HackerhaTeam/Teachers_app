import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/manager/cubit/image_upload_cubit.dart';
import 'package:teacher_hackerha/features/add_new_quiz/presentation/widgets/fields/image_upload_field/build_content.dart';

class ImageUploadField extends StatelessWidget {
  const ImageUploadField({super.key});

  @override
  Widget build(BuildContext context) {
    double contentPadding = 15;
    return BlocBuilder<ImageUploadCubit, ImageUploadState>(
      builder: (context, state) {
        final border = Theme.of(context).extension<AppBorders>()!;
        if (state is ImageUploadLoading || state is ImageUploadSuccess) {
          contentPadding = 20;
        } else {
          contentPadding = 15;
        }
        return SizedBox(
          width: 361.w(context),
          child: InkWell(
            onTap: () => context.read<ImageUploadCubit>().pickImage(),
            child: InputDecorator(
              decoration: InputDecoration(
                enabledBorder: outBorder(border),
                contentPadding: EdgeInsets.all(contentPadding),
                labelText: 'الصورة المرفقة',
                labelStyle: context.xLabelLarge,
                border: outBorder(border),
              ),
              child: buildContentByState(state, context),
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder outBorder(AppBorders border) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: border.secondary),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
