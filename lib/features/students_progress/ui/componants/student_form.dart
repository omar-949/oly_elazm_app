import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/main_functions.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_button_loading.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/core/widgets/app_text.dart';
import 'package:oly_elazm/core/widgets/app_text_form.dart';
import 'package:oly_elazm/core/widgets/custom_drop_down_menu.dart';
import 'package:oly_elazm/features/students_progress/logic/student_progress_cubit.dart';
import 'package:oly_elazm/features/students_progress/logic/student_progress_state.dart';
import 'package:oly_elazm/features/students_progress/ui/componants/student_rating.dart';
import 'package:quran/quran.dart' as quran;

import '../../../../core/theme/app_colors.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController commentController;
  late final TextEditingController newLessonController;
  late final TextEditingController linkController;
  double rate = 5;

  @override
  void initState() {
    commentController = TextEditingController();
    newLessonController = TextEditingController();
    linkController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    newLessonController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentProgressCubit, StudentProgressState>(
      listener: (context, state) {
        if(state.addReviewState.isSuccess) {Navigator.pop(context);
        showToast(text: 'تم اضافة التسميع بنجاح', color: AppColors.successColor);
        }
      },
      builder: (context, state) {
        final suraList = List.generate(
          114,
          (index) => quran.getSurahNameArabic(index + 1),
        );
        return Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StudentRating(
                  onRatingChanged: (rating) {
                    setState(() {
                      rate = rating;
                    });
                  },
                ),
                AppText(
                    text: "اضافة تعليق",
                    textSize: 16.sp,
                    textWeight: FontWeight.bold),
                AppSize.h8.ph,
                AppTextField(
                  hint: 'اكتب تعليقك هنا',
                  borderRadius: 20.r,
                  maxLine: 5,
                  controller: commentController,
                  enabledColor: AppColors.mainAppColor,
                  isFill: false,
                  textStyle: AppTextStyle.font16Bold(),
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'الرجاء ادخال التعليق';
                    } else {
                      return null;
                    }
                  },
                ),
                16.verticalSpace,
                AppText(
                    text: 'اضافة حفظ جديد',
                    textSize: 16.sp,
                    textWeight: FontWeight.bold),
                AppSize.h8.ph,
                CustomDropDownMenu(
                  dropdownMenuEntries: suraList,
                  hintText: 'اختر السورة',
                  onSubmit: (p0) {
                    context
                        .read<StudentProgressCubit>()
                        .changeGiveTaskData(surahName: p0!);
                  },
                  childBuilder: (p0) {
                    return AppText(
                        text: p0!,
                        textWeight: FontWeight.bold,
                        textSize: 16.sp);
                  },
                ),
                if (context.read<StudentProgressCubit>().surahName != null)
                  Row(
                    children: [
                      Expanded(
                        child: CustomDropDownMenu(
                          labelText: "من الايه",
                          dropdownMenuEntries: List.generate(
                            quran.getVerseCount(suraList.indexOf(context
                                        .read<StudentProgressCubit>()
                                        .surahName ??
                                    suraList[0]) +
                                1),
                            (index) => index + 1,
                          ),
                          hintText: 'اختر الايه',
                          onSubmit: (p0) {
                            context
                                .read<StudentProgressCubit>()
                                .changeGiveTaskData(from: p0!);
                          },
                          childBuilder: (p0) {
                            return AppText(
                                text: p0!.toString(),
                                textWeight: FontWeight.bold,
                                textSize: 16.sp);
                          },
                        ),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: CustomDropDownMenu(
                          labelText: "حتى الايه",
                          dropdownMenuEntries: List.generate(
                            quran.getVerseCount(suraList.indexOf(context
                                        .read<StudentProgressCubit>()
                                        .surahName ??
                                    suraList[0]) +
                                1),
                            (index) => index + 1,
                          ),
                          hintText: 'اختر الايه',
                          onSubmit: (p0) {
                            if (context.read<StudentProgressCubit>().from ==
                                null) {
                              showToast(
                                  text: "الرجاء اختيار من الايه",
                                  color: AppColors.errorColor,
                                  time: 4);
                              return;
                            } else if (p0! <
                                context.read<StudentProgressCubit>().from!) {
                              showToast(
                                  text: "الرجاء اختيار ايه تلي الاولي",
                                  color: AppColors.errorColor,
                                  time: 4);
                              return;
                            } else {
                              context
                                  .read<StudentProgressCubit>()
                                  .changeGiveTaskData(to: p0);
                            }
                          },
                          childBuilder: (p0) {
                            return AppText(
                                text: p0!.toString(),
                                textWeight: FontWeight.bold,
                                textSize: 16.sp);
                          },
                        ),
                      ),
                    ],
                  ),
                16.verticalSpace,
                AppText(
                    text: 'اضافة رابط تسميع',
                    textSize: 16.sp,
                    textWeight: FontWeight.bold),
                AppSize.h8.ph,
                AppTextField(
                  hint: 'حدد وقت التسميع',
                  borderRadius: 20.r,
                  controller: newLessonController,
                  enabledColor: AppColors.mainAppColor,
                  isFill: false,
                  suffix: Icon(
                    Icons.access_time,
                    color: AppColors.mainAppColor,
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        DateTime fullDateTime = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );

                        String formattedDateTime =
                            DateFormat('yyyy-MM-dd HH:mm:ss', 'en')
                                .format(fullDateTime);

                        setState(() {
                          newLessonController.text = formattedDateTime;
                        });
                      }
                    }
                  },
                  textStyle: AppTextStyle.font16Bold(),
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'الرجاء ادخال وقت التسميع';
                    }
                    return null;
                  },
                ),
                16.verticalSpace,
                AppText(
                    text: 'اضافة رابط تسميع',
                    textSize: 16.sp,
                    textWeight: FontWeight.bold),
                AppSize.h8.ph,
                AppTextField(
                  hint: 'اضف الرابط هنا',
                  borderRadius: 20.r,
                  controller: linkController,
                  enabledColor: AppColors.mainAppColor,
                  isFill: false,
                  textStyle: AppTextStyle.font16Bold(),
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'الرجاء ادخال رابط التسميع';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.h),
                  child: state.giveTaskState.isLoading ||
                          state.addReviewState.isLoading
                      ? AppButtonLoading(
                          title: 'ارسال',
                        )
                      : CustomAppButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<StudentProgressCubit>().giveTask(
                                    time: newLessonController.text,
                                    meetingLink: linkController.text,
                                desc: commentController.text,
                                rate: rate
                                  );
                            }
                          },
                          title: 'ارسال',
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
