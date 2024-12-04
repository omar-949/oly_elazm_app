enum SelectionType { gender, role }

class SelectionOption {
  final String title;
  final SelectionType type;
  final String option1;
  final String option2;
  final String image1;
  final String image2;

  SelectionOption({
    required this.title,
    required this.type,
    required this.option1,
    required this.option2,
    required this.image1,
    required this.image2,
  });
}
