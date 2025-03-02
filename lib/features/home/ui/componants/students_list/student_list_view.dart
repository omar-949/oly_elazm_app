import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/features/home/data/models/teacher/all_student_model.dart';
import 'package:oly_elazm/features/home/logic/home_cubit.dart';
import 'package:oly_elazm/features/home/logic/home_state.dart';
import 'package:oly_elazm/features/home/ui/componants/students_list/student_list_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theme/app_text_style.dart';



class StudentListView extends StatelessWidget {
  const StudentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled:state.allStudents==null,
          child: state.allStudents?.data?.isEmpty??true?Container(
            child: Center(child: Text('لا يوجد طلاب',style: AppTextStyle.font20Regular(),),),
          ):SizedBox(
            height: 200.h,
            child: ListView.builder(

              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: state.allStudents?.data?.length??10,
              cacheExtent: 300,
              itemBuilder: (context, index) {
                bool isLastItem = index == 9;
                return Padding(
                  padding: EdgeInsets.only(
                    left: isLastItem ? 0 : 12.w,
                    bottom: 12.h,
                  ),
                  child: GestureDetector(
                    onTap: () => context.pushNamed(Routes.studentProgress,arguments: state.allStudents?.data?[index].id),
                    child: StudentListItem(student: state.allStudents?.data?[index]??DataAllStudents(),),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
