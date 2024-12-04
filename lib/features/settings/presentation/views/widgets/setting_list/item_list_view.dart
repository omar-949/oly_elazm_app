import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'custom_list_item.dart';
import 'expandable_item.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.w358,
      child: Column(
        children: [
          CustomListItem(
            icon: 'assets/svgs/tabler_edit.svg',
            label: 'تعديل الملف الشخصي',
            onTap: () {
              context.pushNamed(Routes.editProfileView);
            },
          ),
          Divider(),
          ExpandableItem(
            icon: 'assets/svgs/discord_boost.svg',
            title: 'عدد النقاط',
            pointsLabel: 'إجمالي النقاط: ',
            pointsValue: '120 نقطة',
          ),
          Divider(),
          CustomListItem(
            icon: 'assets/svgs/Verified_Person.svg',
            label: 'المُحفظ',
            onTap: () {
              context.pushNamed(Routes.elmohafezDetailsView);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
