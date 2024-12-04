import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/features/settings/presentation/views/widgets/elmohafez/review_card.dart';


class ReviewsList extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;

  const ReviewsList({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'كل التعليقات',
            style: AppTextStyle.font18Bold().copyWith(fontFamily: 'Roboto'),
          ),
        ),
        SizedBox(height: 10.h),
        // List of Review Cards
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final review = reviews[index];
            return ReviewCard(
              imageUrl: review['imageUrl'],
              name: review['name'],
              date: review['date'],
              rating: review['rating'],
              comment: review['comment'],
            );
          },
        ),
      ],
    );
  }
}
