import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'rating_row_widget.dart';

class RatingBarWidget extends StatelessWidget {
  final List<double> ratings;

  const RatingBarWidget({
    Key? key,
    required this.ratings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        ratings.length,
            (index) => Padding(
          padding: EdgeInsets.only(bottom: AppSize.h8),
          child: RatingRow(
            rating: 5.0 - index,
            progress: ratings[index],
          ),
        ),
      ),
    );
  }
}
