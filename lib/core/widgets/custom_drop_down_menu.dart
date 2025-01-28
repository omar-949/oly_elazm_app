import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';

import '../helpers/app_size.dart';
import 'app_text.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    this.hintText,
     this.fillColor,
    required this.dropdownMenuEntries,
     this.borderColor,
     this.iconColor,
     this.hintColor,
    this.labelText,
     this.labelColor,
    this.width = double.infinity,
    this.onSubmit,
    this.initialValue, // Initial value property
    required this.childBuilder, // Function to build custom dropdown items
    this.selectedItemBuilder, // Function to build custom selected item
    this.enabled,
    this.isValidate = true,
  });

  final String? hintText, labelText;
  final Color? borderColor, iconColor, fillColor, hintColor, labelColor;
  final List<T> dropdownMenuEntries;
  final double width;
  final void Function(T?)? onSubmit;
  final T? initialValue; // Initial value
  final Widget Function(T?) childBuilder; // Builds custom children
  final Widget Function(T?)? selectedItemBuilder; // Builds custom selected item
  final bool? enabled, isValidate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          AppText(
            text: labelText!,
            textColor: labelColor??AppColors.black,
            textSize: 16,
            textWeight: FontWeight.w500,
          ),
          10.ph,
        ],
        SizedBox(
          width: width,
          child: Material(
            borderRadius: BorderRadius.circular(12.r),
            color: fillColor??AppColors.white,
            child: DropdownButtonFormField<T>(
              value: initialValue, // Set initial value here
              validator: isValidate == true
                  ? (value) => value == null ? 'يرجى التحديد' : null
                  : null,
              icon: Icon(
                Icons.keyboard_arrow_up_rounded,
                size: 30,
                color: iconColor??AppColors.mainAppColor,
              ),
              hint: AppText(
                text:hintText ?? '',
                textColor: hintColor,

              ),
              menuMaxHeight: 300.h, // Adjust height if needed
              decoration: InputDecoration(
                enabled: enabled ?? true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppSize.w12,
                  vertical: AppSize.h10,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: borderColor??AppColors.mainAppColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: borderColor??AppColors.mainAppColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: borderColor??AppColors.mainAppColor),
                ),
              ),
              onChanged: onSubmit,
              // Custom dropdown items
              items: dropdownMenuEntries
                  .map(
                    (e) => DropdownMenuItem<T>(
                  value: e,
                  child: childBuilder(e), // Custom child for each dropdown item
                ),
              )
                  .toList(),
              // Custom selected item view
              selectedItemBuilder: selectedItemBuilder != null
                  ? (context) => dropdownMenuEntries
                  .map(
                    (e) => selectedItemBuilder!(e), // Custom selected item
              )
                  .toList()
                  : null, // Optional if you don't want a custom selected item
            ),
          ),
        ),
      ],
    );
  }
}
