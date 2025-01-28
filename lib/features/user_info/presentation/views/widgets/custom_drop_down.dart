import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_text_form.dart';
import 'package:oly_elazm/features/user_info/data/model/drop_down_item.dart';
import 'package:oly_elazm/features/user_info/presentation/manager/user_info_cubit.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    required this.headerImage,
    required this.onItemSelected,
  });

  final String title;
  final String headerImage;
  final ValueChanged<String> onItemSelected;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  DropDownItem? selectedItem;
  bool isOpen = false;
  TextEditingController customController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 0.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.mainAppColor,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      selectedItem != null
                          ? Row(
                        children: [
                          Image.asset(selectedItem!.image),
                          10.horizontalSpace,
                          Text(
                            selectedItem!.name,
                            style: AppTextStyle.font18SemiBold(
                                color: Colors.black),
                          ),
                        ],
                      )
                          : Row(
                        children: [
                          Image.asset(widget.headerImage),
                          10.horizontalSpace,
                          BlocBuilder<UserInfoCubit, UserInfoState>(
                            builder: (context, state) {
                              return  Text(
                                state is UserInfoUpdated ? state.userInfoModel?.job ?? widget.title : widget.title,
                                style: AppTextStyle.font18SemiBold(
                                    color: Colors.black),
                              );
                            },
                          ),
                        ],
                      ),
                      AnimatedRotation(
                        turns: isOpen ? 0.5 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.black,
                          size: 30.w,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: isOpen ? 100.h : 0, // Height adjusts for TextField
                  curve: Curves.easeInOut,
                  child: isOpen
                      ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.h, horizontal: 12.w),
                    child: BlocBuilder<UserInfoCubit, UserInfoState>(
                      builder: (context, state) {
                        if (state is UserInfoUpdated) {
                          customController.text = state.userInfoModel?.job ??
                              "";
                        }
                        return AppTextField(
                          controller: customController,
                          hint: 'اكتب هنا',
                          isFill: false,
                          borderRadius: 12.r,
                          type: TextInputType.text,
                          maxLine: 1,
                          onFieldSubmitted: (p0) {
                            if (customController.text.isNotEmpty) {
                              setState(() {
                                selectedItem = DropDownItem(
                                  name: customController.text,
                                  image: widget.headerImage,
                                );
                                isOpen = false;
                              });
                              widget.onItemSelected(customController.text);
                            }
                          },
                          enabledColor: AppColors.mainAppColor,
                          suffix: IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              if (customController.text.isNotEmpty) {
                                setState(() {
                                  selectedItem = DropDownItem(
                                    name: customController.text,
                                    image: widget.headerImage,
                                  );
                                  isOpen = false;
                                });
                                widget.onItemSelected(customController.text);
                              }
                            },
                          ),
                          validator: (p0) {},
                        );
                      },
                    ),
                  )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
