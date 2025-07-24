import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:teacher_hackerha/core/themes/extentions/app_borders.dart';
import 'package:teacher_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/custom_divider.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/home_header.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/home_page_statistics_list.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/monthly_trainer_page_view.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>with SingleTickerProviderStateMixin {
  
 
  @override
  Widget build(BuildContext context) {
   
    var border = Theme.of(context).extension<AppBorders>()!;
    var bg = Theme.of(context).extension<AppBackgrounds>()!;
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(child: SafeArea(child: HomeHeader())),
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      SliverToBoxAdapter(child: HomeDivider()),
      SliverToBoxAdapter(child: SizedBox(height: 24,)),
      SliverToBoxAdapter(child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w(context)),
        child: Text("إحصائيات",style:  context.xHeadingLarge,),
      ),),
      SliverToBoxAdapter(child: SizedBox(height: 16,),),
      SliverToBoxAdapter(child: HomePageStatisticsList(),),
      SliverToBoxAdapter(child: SizedBox(height: 24,),),
      SliverToBoxAdapter(child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w(context)),
        child: Text("مدرسي الشهر",style:  context.xHeadingLarge,),
      ),),
      SliverToBoxAdapter(child: SizedBox(height: 16,),)
,      SliverToBoxAdapter(child: MonthlyTrainerPageView( bg: bg, borders: border),)
      
      ],);
  }
}
