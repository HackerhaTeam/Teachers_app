import 'package:flutter/material.dart';
import 'package:teacher_hackerha/core/functions/get_responsive_size.dart';
import 'package:teacher_hackerha/features/home/presentation/widgets/home_page_statistics_item.dart';

class HomePageStatisticsList extends StatelessWidget {
  const HomePageStatisticsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 20.w(context)),
      child: SizedBox(height: 108.w(context),child: ListView.builder(itemCount: 5,scrollDirection: Axis.horizontal,itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(left: 12.w(context) ),
        child: HomePageStatisticsItem(),
      ),)),
    );
  }
}
