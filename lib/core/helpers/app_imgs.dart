String svgIconsName(String? icon) {
  return 'assets/icons/$icon.svg';
}

String pngImageName(String? image) {
  return 'assets/images/$image.png';
}

class AppIcons {
  static String get logoIcon => svgIconsName('logo');
  static String get egyptIcon => svgIconsName('egypt');
}

class AppImages {
  static String get logoIcon => pngImageName('logo');
  static String get egyptLogo => pngImageName('egypt');
  static String get onboarding1 => pngImageName('onboarding1');
  static String get onboarding2 => pngImageName('onboarding2');
  static String get onboarding3 => pngImageName('onboarding3');
  static String get waitingImage => pngImageName('wating_image');
  static String get azkar => pngImageName('azkar');

  static const String dots = 'assets/svgs/dots.svg';
  static const String group = 'assets/svgs/Group.svg';
  static const String alarm = 'assets/svgs/Time.svg';
  static const String notes = 'assets/svgs/Notes.svg';

  static const String continueBackground = 'assets/images/containue.png';
  static const String quranIcon = 'assets/images/arcticons_al-quran-indonesia.png';
}
