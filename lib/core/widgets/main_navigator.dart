import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/di/dependency_injection.dart';
import 'package:oly_elazm/core/widgets/app_nav_bar.dart';
import 'package:oly_elazm/features/home/logic/home_cubit.dart';
import 'package:oly_elazm/features/home/ui/home_view.dart';
import 'package:oly_elazm/features/praying/logic/praying_cubit.dart';
import 'package:oly_elazm/features/praying/ui/pray_page.dart';
import 'package:oly_elazm/features/settings/presentation/views/setting_view.dart';

import '../../features/quran/welcome.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: HomeView(),
    ),
    BlocProvider(
      create: (context) => PrayingCubit(),
      child: const PrayPage(),
    ),
    const Welcome(),
    const PlaceholderScreen(title: 'Pray Screen'),
    const SettingView(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    if (index != 3) {
      _pageController.jumpToPage(index); // Sync page navigation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
      bottomNavigationBar: AppNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
