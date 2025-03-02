import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/features/user_info/presentation/manager/user_info_cubit.dart';

import '../../../../../core/theme/app_text_style.dart';

enum TajweedLevel {
  tahqiq(1, "التحقيق", "القراءة بتأنٍ ووضوح شديدين"),
  tadweer(2, "التدوير", "القراءة بسرعة معتدلة مع وضوح الأحكام"),
  hadr(3, "الحدر", "القراءة بسرعة مع المحافظة على الأحكام");

  final int value;
  final String title;
  final String subtitle;

  const TajweedLevel(this.value, this.title, this.subtitle);
}

class TajweedLevelApp extends StatelessWidget {
  const TajweedLevelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TajweedSelectionScreen(),
    );
  }
}

class TajweedSelectionScreen extends StatefulWidget {
  const TajweedSelectionScreen({super.key});

  @override
  TajweedSelectionScreenState createState() => TajweedSelectionScreenState();
}

class TajweedSelectionScreenState extends State<TajweedSelectionScreen> {
  TajweedLevel? selectedTajweedLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ Text("اختر مستوى التجويد",style: AppTextStyle.font20SemiBold(color: AppColors.secondaryAppColor)).addSymmetricPadding(hVal:
        16.w)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<UserInfoCubit, UserInfoState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: TajweedLevel.values.map((level) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: CheckboxListTile(
                    activeColor: AppColors.mainAppColor,
                    title: Text(level.title,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(level.subtitle,
                        style: TextStyle(color: Colors.grey)),
                    value: selectedTajweedLevel == level,
                    onChanged: (bool? isSelected) {
                      setState(() {
                        selectedTajweedLevel =
                            isSelected == true ? level : null;
                        context.read<UserInfoCubit>().updateData(
                            yearsOfExperience: selectedTajweedLevel?.value);
                      });

                    },
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
