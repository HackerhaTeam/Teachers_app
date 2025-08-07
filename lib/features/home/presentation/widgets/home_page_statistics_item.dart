import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/core/widgets/custom_card.dart';
import 'package:teacher_hackerha/features/course%20detiles/presentation/widgets/Course%20informations/icon_text.dart';

class HomePageStatisticsItem extends StatelessWidget {
  const HomePageStatisticsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      alignment: Alignment.center,
      backgroundColor:
          Theme.of(context).extension<AppBackgrounds>()!.onSurfacePrimary,
    
      width: 234.w(context),
    
      borderRadius: 8.r(context),
      borderColor: Theme.of(context).extension<AppBorders>()!.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
    
            children: [
              SizedBox(height: 16),
              IconText(
                iconColor:
                    Theme.of(
                      context,
                    ).extension<AppBackgrounds>()!.primaryBrand,
                icon: PhosphorIconsBold.moneyWavy,
                title: "إجمالي أرباحك",
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              SizedBox(height: 8),
    
              Flexible( flex:1
              ,fit:FlexFit.tight,child: Text("${9500000} ل.س ", style: context.xDisplayLarge,overflow:TextOverflow.ellipsis ,maxLines: 2,)),
              SizedBox(height: 12),
            ],
          ),
        ],
      ),
    );
  }
}
