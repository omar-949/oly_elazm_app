import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/features/user_info/data/model/drop_down_item.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/custom_drop_down.dart';

class CountryAndLang extends StatelessWidget {
  const CountryAndLang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomDropDown(
              title: 'البلد',
              headerImage: 'assets/images/egypt.png',
              items: DropDownItem.countries,
              onItemSelected: (DropDownItem value) {},
            ),
            10.verticalSpace,
            CustomDropDown(
              title: 'اللغه',
              headerImage: 'assets/images/language.png',
              items: const [],
              onItemSelected: (DropDownItem value) {},
            ),
            10.verticalSpace,
            CustomDropDown(
              title: 'المهنة',
              headerImage: 'assets/images/Careers.png',
              items: const [],
              onItemSelected: (DropDownItem value) {},
            ),
          ],
        ),
      ),
    );
  }
}
