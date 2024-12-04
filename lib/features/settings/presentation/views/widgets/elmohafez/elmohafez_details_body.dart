import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/widgets/info_header_section.dart';
import 'add_comment_section.dart';
import 'elmohafez_rating.dart';
import 'lesson_overview.dart';
import 'rating_bar_widget.dart';
import 'reviews_list.dart';

class ElmohafezDetailsBody extends StatefulWidget {
  const ElmohafezDetailsBody({super.key});

  @override
  State<ElmohafezDetailsBody> createState() => _ElmohafezDetailsBodyState();
}

class _ElmohafezDetailsBodyState extends State<ElmohafezDetailsBody> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController commentController;

  @override
  void initState() {
    commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reviews = [
      {
        'imageUrl': 'assets/images/reviewboy.png',
        'name': 'علي أكرم',
        'date': '03/11/2024',
        'rating': 4.5,
        'comment':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea',
      },
      {
        'imageUrl': 'assets/images/reviewboy.png',
        'name': 'علي أكرم',
        'date': '03/11/2024',
        'rating': 3.5,
        'comment':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea',
      },
      {
        'imageUrl': 'assets/images/reviewboy.png',
        'name': 'علي أكرم',
        'date': '03/11/2024',
        'rating': 4.5,
        'comment':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea',
      },
      {
        'imageUrl': 'assets/images/reviewboy.png',
        'name': 'علي أكرم',
        'date': '03/11/2024',
        'rating': 3.5,
        'comment':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut aliquip ex ea',
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          const InfoHeaderSection(
            studentName: 'أحمد عمرو',
            imagePath: 'assets/images/elmohafez.png',
            userType: 'مُحفظ',
          ),
          15.ph,
          const  RatingBarWidget(
            ratings: [0.8, 0.6, 0.5, 0.3, 0.1],
          ),
          15.ph,
          const LessonOverview(),
          15.ph,
          const ElmohafezRating(),
          15.ph,
          AddCommentSection(
            formKey: formKey,
            commentController: commentController,
          ),
          15.ph,
          ReviewsList(reviews: reviews),
        ],
      ),
    );
  }
}
