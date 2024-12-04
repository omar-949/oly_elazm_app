import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/students_list/student_list_item.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: 10,
        cacheExtent: 300,
        itemBuilder: (context, index) {
          bool isLastItem = index == 9;
          return Padding(
            padding: EdgeInsets.only(
              left: isLastItem ? 0 : 12.w,
              bottom: 12.h,
            ),
            child: GestureDetector(
              onTap: () => context.pushNamed(Routes.studentProgress),
              child: StudentListItem(),
            ),
          );
        },
      ),
    );
  }
}
