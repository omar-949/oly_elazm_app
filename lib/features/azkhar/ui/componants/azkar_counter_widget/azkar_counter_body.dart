import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_button.dart';
import 'package:oly_elazm/core/widgets/app_text.dart';
import 'package:oly_elazm/features/azkhar/data/models/azkhar_model.dart';
import 'package:oly_elazm/features/azkhar/logic/azkar_cubit.dart';
import 'package:oly_elazm/features/azkhar/logic/azkar_state.dart';

class AzkarCounterBody extends StatelessWidget {
  const AzkarCounterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkharState>(
      builder: (context, state) {
        AzkarModel data = context.read<AzkarCubit>().azkar;
        AzkarCubit cubit = context.read<AzkarCubit>();
        return Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: data.category ?? ""),
                    AppText(
                        text:
                            "${cubit.currentPageIndex + 1}/${data.array?.length} "),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ).addSymmetricPadding(hVal: 16.w),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: AppText(
                      text: data.array?[index].text ?? "_",
                      fontFamily: GoogleFonts.amiriQuran().fontFamily,
                      textSize: 18.sp,
                      textWeight: FontWeight.w600,
                    ),
                  );
                },
                onPageChanged: (index) {
                  cubit.onPageChanged(index);
                },
                controller: cubit.pageController,
                itemCount: data.array?.length ?? 0,
              ).addSymmetricPadding(hVal: 16.w),
            ),
            BottomAppBar(
              shape: CircularNotchedRectangle(),
              height: 100.h,
              color: AppColors.mainAppColor,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      height: 70.h,
                      width: 70.w,
                      background: Colors.green,
                      radius: 140.r,
                      onTap: () {
                        cubit.changeCount();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText(
                            text:
                                '${data.array?[cubit.currentPageIndex].count}/',
                            textColor: Colors.white,
                          ),
                          AppText(
                            text: cubit.currentCount.toString(),
                            textColor: Colors.white,
                            textSize: 20.sp,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next,
                          color: cubit.currentPageIndex == 0
                              ? Colors.grey
                              : Colors.white),
                      onPressed: () {
                        cubit.prevPage();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        cubit.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () {

                        cubit.play();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_previous,
                          color:
                              cubit.currentPageIndex == data.array!.length - 1
                                  ? Colors.grey
                                  : Colors.white),
                      onPressed: () {
                        cubit.nextPage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
