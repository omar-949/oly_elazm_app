import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/validations.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_form_item.dart';
import 'package:oly_elazm/features/user_info/data/model/drop_down_item.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/custom_drop_down.dart';

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


  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressController = TextEditingController();
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

  void _onSubmit() {
    if (formKey.currentState!.validate()) {
      context.pushReplacementNamed(Routes.mainNav);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            24.ph,
            AppFormItem(
              title: 'الاسم بالكامل',
              hint: 'محمد علي',
              controller: emailController,
              type: TextInputType.name,
              validator: Validations.userNameValidator,
              autoValidateMode: autoValidateMode,
              suffix: Icon(Icons.edit_outlined, size: 24,),

            ),
            16.ph,
            AppFormItem(
              title: 'البريد الالكتروني',
              hint: 'mohammed455@gmail.com',
              controller: emailController,
              type: TextInputType.emailAddress,
              validator: Validations.emailValidator,
              autoValidateMode: autoValidateMode,
              suffix: Icon(Icons.edit_outlined, size: 24,),

            ),
            16.ph,
            AppFormItem(
              title: 'رقم الهاتف',
              hint: '01234567899',
              controller: phoneNumberController,
              type: TextInputType.number,
              validator: Validations.phoneNumberValidator,
              autoValidateMode: autoValidateMode,
              suffix: Icon(Icons.edit_outlined, size: 24,),

            ),
            16.ph,
            AppFormItem(
              title: 'العنوان',
              hint: 'الزقازيق',
              controller: phoneNumberController,
              type: TextInputType.streetAddress,
              autoValidateMode: autoValidateMode,
              suffix: Icon(Icons.edit_outlined, size: 24,),
              ),
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
            CustomDropDown(
              title: 'مصر',
              headerImage: 'assets/images/egypt.png',
              items: DropDownItem.countries,
              onItemSelected: (DropDownItem value) {},
            ),
            6.ph,
            SubmitButton(
              formKey: formKey,
              autoValidateMode: autoValidateMode,
              onSubmit: _onSubmit, onAutoValidateChange: _onAutoValidateChange,
            ),
          ],
        ),
      ),
    );
  }
}
