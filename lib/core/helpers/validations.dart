import 'package:oly_elazm/core/helpers/app_regex.dart';

class Validations {
  static String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "اسم المستخدم لا يمكن أن يكون فارغًا.";
    }
    if (value.length <= 2) {
      return "يجب أن يكون اسم المستخدم مكونًا من 3 أحرف على الأقل.";
    }
    if (value.length > 40) {
      return "لا يمكن أن يتجاوز اسم المستخدم 40 حرفًا.";
    }
    if (!AppRegex.isUsernameValid(value)) {
      return "يرجى إدخال اسم مستخدم صالح.";
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب.';
    }
    if (!AppRegex.isEmailValid(value)) {
      return 'يرجى إدخال بريد إلكتروني صالح.';
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب.';
    }
    if (value.length < 10) {
      return 'يرجى إدخال رقم هاتف صالح.';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة.';
    }
    if (value.length < 8) {
      return 'يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل.';
    }
    if (!AppRegex.hasUpperCase(value)) {
      return 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل.';
    }
    if (!AppRegex.hasLowerCase(value)) {
      return 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل.';
    }
    if (!AppRegex.hasNumber(value)) {
      return 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل.';
    }
    return null;
  }

  static String? passwordConfirmValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب.';
    }
    if (value != password) {
      return 'كلمات المرور غير متطابقة.';
    }
    return null;
  }

  static String? loginPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة.';
    }
    if (value.length < 8) {
      return 'يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل.';
    }
    return null;
  }
}
