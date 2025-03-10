import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/di/dependency_injection.dart';
import 'package:oly_elazm/core/widgets/app_nav_bar.dart';
import 'package:oly_elazm/features/azkhar/logic/azkar_cubit.dart';
import 'package:oly_elazm/features/home/logic/home_cubit.dart';
import 'package:oly_elazm/features/home/ui/home_view.dart';
import 'package:oly_elazm/features/settings/logic/setting_cubit.dart';
import 'package:oly_elazm/features/settings/views/setting_view.dart';

import '../../features/azkhar/ui/all_azkar_view.dart';
import '../../features/quran/welcome.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: HomeView(),
    ),
    const Welcome(),
    BlocProvider(
      create: (context) =>
      getIt<AzkarCubit>()
        ..loadAzkar(),
      child: AllAzkarView(),
    ),
    BlocProvider(
      create: (context) => getIt<SettingCubit>()..getProfile(),
      child: SettingView(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: AppNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
