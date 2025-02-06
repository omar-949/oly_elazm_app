import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/validations.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_button_loading.dart';
import 'package:oly_elazm/core/widgets/app_form_item.dart';
import 'package:oly_elazm/features/settings/logic/setting_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helpers/app_size.dart';
import '../../../../../core/helpers/font_weight_helper.dart';
import '../../../../../core/helpers/main_functions.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_drop_down_menu.dart';
import '../../../data/models/students/profile_model.dart';
import '../../../logic/setting_state.dart';
import 'submit_button.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<EditProfileForm> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController addressController;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  List<dynamic> country = [];

  Future<void> loadCountries() async {
    final String response =
        await rootBundle.loadString('assets/jsons/countries.json');
    final data = await json.decode(response);
    setState(() {
      country = data;
    });
  }

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressController = TextEditingController();
    loadCountries();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void _onAutoValidateChange(AutovalidateMode mode) {
    setState(() {
      autoValidateMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: BlocConsumer<SettingCubit, SettingState>(
          listener: (context, state) {
            if (state.updateProfileState.isSuccess) {
              showToast(
                  text: 'تم التعديل بنجاح', color: AppColors.successColor);
              context.pushNamedAndRemoveUntil(
                Routes.mainNav,
                predicate: (route) => false,
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                24.ph,
                AppFormItem(
                  title: 'الاسم بالكامل',
                  hint: state.profileModel?.data?.name ?? "_",
                  controller: nameController,
                  type: TextInputType.name,
                  validator: Validations.userNameValidator,
                  autoValidateMode: autoValidateMode,
                  suffix: Icon(
                    Icons.edit_outlined,
                    size: 24,
                  ),
                ),
                16.ph,
                AppFormItem(
                  title: 'البريد الالكتروني',
                  hint: state.profileModel?.data?.email ?? "_",
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validator: Validations.emailValidator,
                  autoValidateMode: autoValidateMode,
                  suffix: Icon(
                    Icons.edit_outlined,
                    size: 24,
                  ),
                ),
                16.ph,
                AppFormItem(
                  title: 'رقم الهاتف',
                  hint: state.profileModel?.data?.phoneNumber ?? "_",
                  controller: phoneNumberController,
                  type: TextInputType.number,
                  validator: Validations.phoneNumberValidator,
                  autoValidateMode: autoValidateMode,
                  suffix: Icon(
                    Icons.edit_outlined,
                    size: 24,
                  ),
                ),
                16.ph,
                16.ph,
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Text(
                        'البلد',
                        style: AppTextStyle.font16Medium(),
                      ),
                    ),
                  ],
                ),
                8.ph,
                Skeletonizer(
                  enabled: country.isEmpty,
                  child: CustomDropDownMenu(
                    dropdownMenuEntries: country,
                    initialValue: country.firstWhere((p0) =>
                        p0['name'] == state.profileModel?.data?.country),
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
                      addressController.text = p0['name'];
                    },
                    hintText: "اختر الدوله",
                  ),
                ),
                6.ph,
                state.updateProfileState.isLoading
                    ? AppButtonLoading(title: "تم")
                    : SubmitButton(
                        formKey: formKey,
                        autoValidateMode: autoValidateMode,
                        onSubmit: () {
                          context.read<SettingCubit>().updateProfile(
                                  profileModel: ProfileModel(
                                      data: Data(
                                name: nameController.text == ""
                                    ? state.profileModel?.data?.name
                                    : nameController.text,
                                email: emailController.text == ""
                                    ? state.profileModel?.data?.email
                                    : emailController.text,
                                phoneNumber: phoneNumberController.text == ""
                                    ? state.profileModel?.data?.phoneNumber
                                    : phoneNumberController.text,
                                country: addressController.text == ""
                                    ? state.profileModel?.data?.country
                                    : addressController.text,
                              )));
                        },
                        onAutoValidateChange: _onAutoValidateChange,
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
