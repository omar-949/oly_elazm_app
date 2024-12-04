import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/features/user_info/presentation/manager/user_info_cubit.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/chapters/chapters_list_view_item.dart';

class ChaptersListVIewBuilder extends StatelessWidget {
  const ChaptersListVIewBuilder({
    super.key,
  });

  static const List<String> partsOfQuran = [
    'الجزء الأول',
    'الجزء الثاني',
    'الجزء الثالث',
    'الجزء الرابع',
    'الجزء الخامس',
    'الجزء السادس',
    'الجزء السابع',
    'الجزء الثامن',
    'الجزء التاسع',
    'الجزء العاشر',
    'الجزء الحادي عشر',
    'الجزء الثاني عشر',
    'الجزء الثالث عشر',
    'الجزء الرابع عشر',
    'الجزء الخامس عشر',
    'الجزء السادس عشر',
    'الجزء السابع عشر',
    'الجزء الثامن عشر',
    'الجزء التاسع عشر',
    'الجزء العشرون',
    'الجزء الحادي والعشرون',
    'الجزء الثاني والعشرون',
    'الجزء الثالث والعشرون',
    'الجزء الرابع والعشرون',
    'الجزء الخامس والعشرون',
    'الجزء السادس والعشرون',
    'الجزء السابع والعشرون',
    'الجزء الثامن والعشرون',
    'الجزء التاسع والعشرون',
    'الجزء الثلاثون'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        String? selectedChapter = (state is UserInfoUpdated) ? state.selectedChapter : null;
        bool notStarted = (state is UserInfoUpdated) ? state.notStarted : false;
        return ListView.builder(
          itemCount: partsOfQuran.length,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final chapter = partsOfQuran[index];
            final isSelected = selectedChapter == chapter;
            return ChaptersListViewItem(
              text: partsOfQuran[index],
              isSelected: isSelected,
              onTap: () {
                !notStarted
                    ? context.read<UserInfoCubit>().selectChapter(chapter)
                    : null;
              },
            );
          },
        );
      },
    );
  }
}
