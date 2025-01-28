import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/app_strings.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/font_weight_helper.dart';
import 'package:oly_elazm/core/helpers/shared_prefrences.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_text.dart';
import 'package:oly_elazm/features/user_info/presentation/manager/user_info_cubit.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/custom_drop_down.dart';

import '../../../../../core/widgets/custom_drop_down_menu.dart';

class CountryAndLang extends StatefulWidget {
  const CountryAndLang({
    super.key,
  });

  @override
  State<CountryAndLang> createState() => _CountryAndLangState();
}

class _CountryAndLangState extends State<CountryAndLang> {
  List<dynamic> country = [];

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  Future<void> loadCountries() async {
    final String response =
        await rootBundle.loadString('assets/jsons/countries.json');
    final data = await json.decode(response);
    setState(() {
      country = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = [
      {"ar": "اللغة العربيه"}, // Entry 1
      {"en": "اللغة الإنجليزية"} // Entry 2
    ];
    return Center(
      child: SingleChildScrollView(
        child: BlocBuilder<UserInfoCubit, UserInfoState>(
          builder: (context, state) {
            return Column(
              children: [
                CustomDropDownMenu(
                  dropdownMenuEntries: country,
                  initialValue: country.isEmpty ? null : country[51],
                  selectedItemBuilder: (p0) {
                    return Row(
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://flagcdn.com/w40/${p0?['alpha2']?.toLowerCase() ?? ''}.png',
                                ),
                              )),
                        ),
                        AppSize.w10.pw,
                        AppText(
                          text: p0['name'],
                          textColor: AppColors.black,
                          textWeight: FontWeightHelper.bold,
                          textSize: 16.sp,
                        ),
                      ],
                    );
                  },
                  childBuilder: (p0) {
                    return Row(
                      children: [
                        Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://flagcdn.com/w40/${p0?['alpha2'] ?? "eg".toLowerCase()}.png',
                                  ))),
                        ),
                        AppSize.w10.pw,
                        AppText(text: p0['name']),
                      ],
                    );
                  },
                  onSubmit: (p0) {
                    context
                        .read<UserInfoCubit>()
                        .updateData(country: p0['name']);
                  },
                  hintText: "اختر الدوله",
                ),
                AppSize.h10.ph,
                CustomDropDownMenu<Map<String, String>>(
                  dropdownMenuEntries: lang,
                  initialValue: lang[0],
                  selectedItemBuilder: (value) {
                    return Row(
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/language.png'),
                            ),
                          ),
                        ),
                        AppSize.w8.pw,
                        AppText(
                          text: SharedPrefHelper.getString(
                                    AppStrings.langKey,
                                  ) ==
                                  ""
                              ? value!.values.first
                              : lang
                                  .where((element) =>
                                      element.keys.first ==
                                      SharedPrefHelper.getString(
                                          AppStrings.langKey))
                                  .first
                                  .values
                                  .first,
                          textColor: AppColors.black,
                          textWeight: FontWeightHelper.bold,
                          textSize: 16.sp,
                        )
                      ],
                    );
                  },
                  childBuilder: (value) {
                    return AppText(text: value!.values.first);
                  },
                  onSubmit: (value) {
                    SharedPrefHelper.setData(
                        AppStrings.langKey, value!.keys.first);
                  },
                  hintText: "اختر اللغة",
                ),
                10.verticalSpace,
                CustomDropDown(
                  title: 'المهنة',
                  headerImage: 'assets/images/Careers.png',
                  onItemSelected: (value) {
                    log(value);
                    context.read<UserInfoCubit>().updateData(job: value);

                    // log(context.read<UserInfoCubit>().userInfoModel.job ?? "nnnn");
                  },
                )
              ],
            );
          },
        ).addSymmetricPadding(hVal: 16.w),
      ),
    );
  }
}
