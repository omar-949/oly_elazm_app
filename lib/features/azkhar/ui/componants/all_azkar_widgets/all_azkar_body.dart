import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oly_elazm/core/helpers/app_imgs.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_image_view.dart';
import 'package:oly_elazm/core/widgets/app_text.dart';
import 'package:oly_elazm/features/azkhar/logic/azkar_cubit.dart';
import 'package:oly_elazm/features/azkhar/logic/azkar_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllAzkarBody extends StatelessWidget {
  const AllAzkarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppImageView(
          imagePath: AppImages.azkar,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Expanded(
          child: BlocBuilder<AzkarCubit, AzkharState>(
            builder: (context, state) {
              return Skeletonizer(
                enabled: state.azkharState.isLoading && state.azkhar == null,
                child: ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.azkarCountView,arguments: state.azkhar?[index]);
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: AppColors.mainAppColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Center(
                                child: AppImageView(imagePath: "assets/svgs/pray.svg"),
                              ),
                            ),
                            AppSize.w8.pw,
                            Expanded(
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: state.azkhar?[index].category ?? "_",
                                    textSize: 20.sp,
                                    textWeight: FontWeight.bold,
                                    textColor: AppColors.mainAppColor,
                                    fontFamily:GoogleFonts.amiriQuran().fontFamily,
                                  ),
                                  AppText(
                                    text:
                                        "عدد الأذكار :${state.azkhar?[index].array?.length ?? "_"}",
                                    textSize: 15.sp,
                                    textColor: AppColors.hintTextColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          color: AppColors.mainAppColor,
                        ),
                    itemCount: state.azkhar?.length ?? 10),
              );
            },
          ),
        ),
      ],
    );
  }
}
