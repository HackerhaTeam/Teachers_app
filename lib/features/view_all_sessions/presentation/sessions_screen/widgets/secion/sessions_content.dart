import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/sessions/presentation/sessions_screen/widgets/secion/sessions_footer.dart';
import 'package:teacher_hackerha/features/sessions/presentation/sessions_screen/widgets/secion/sessions_header.dart';
import 'package:teacher_hackerha/features/sessions/presentation/sessions_screen/widgets/secion/sessions_list.dart';
import 'package:teacher_hackerha/features/sessions/presentation/shared/widgets/sessions_feature_body.dart';

class SessionsContent extends StatelessWidget {
  const SessionsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w(context),
        vertical: 20.h(context),
      ),
      child: Column(
        children: [
          SessionsHeader(),
          SizedBox(height: 34.h(context)),
          Expanded(child: SessionsFeaturBody(list: SessionsList())),
          SizedBox(height: 16.h(context)),
          SessionsFooter(),
        ],
      ),
    );
  }
}
