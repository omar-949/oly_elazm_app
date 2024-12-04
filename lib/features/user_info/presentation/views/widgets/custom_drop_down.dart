import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/features/user_info/data/model/drop_down_item.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.items,
    required this.title,
    required this.headerImage,
    required this.onItemSelected,
  });

  final String title;
  final String headerImage;
  final List<DropDownItem> items;
  final ValueChanged<DropDownItem> onItemSelected;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  DropDownItem? selectedItem;
  bool isOpen = false;

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
                                Text(
                                  widget.title,
                                  style: AppTextStyle.font18SemiBold(
                                      color: Colors.black),
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
                  curve: Curves.easeInOut,
                  height: 2,
                  color: isOpen ? AppColors.mainAppColor : Colors.transparent,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: isOpen
                      ? (widget.items.isNotEmpty
                          ? widget.items.length * 44
                          : 50)
                      : 0,
                  curve: Curves.easeInOut,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(vertical: 0.h, horizontal: 12.w),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItem = widget.items[index];
                            isOpen = false;
                          });
                          widget.onItemSelected(widget.items[index]);
                        },
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.w),
                            child: Row(
                              children: [
                                Image.asset(widget.items[index].image),
                                10.horizontalSpace,
                                Text(
                                  widget.items[index].name,
                                  style: AppTextStyle.font18SemiBold(
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
