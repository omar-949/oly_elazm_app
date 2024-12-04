class DropDownItem {
  final String name;
  final String image;

  const DropDownItem({required this.name, required this.image});

  static const List<DropDownItem> countries = [
    DropDownItem(name: 'مصر', image: 'assets/images/egypt.png'),
    DropDownItem(name: 'أندورا', image: 'assets/images/andorra.png'),
    DropDownItem(name: 'ألبانيا', image: 'assets/images/albania.png'),
    DropDownItem(name: 'الأرجنتين', image: 'assets/images/argentina.png'),
    DropDownItem(name: 'النمسا', image: 'assets/images/australia.png'),
    DropDownItem(name: 'أستراليا', image: 'assets/images/austria.png'),
    DropDownItem(name: 'بلجيكا', image: 'assets/images/belgium.png'),
  ];
}
