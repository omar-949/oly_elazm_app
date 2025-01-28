import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/di/dependency_injection.dart';
import 'package:oly_elazm/core/widgets/app_nav_bar.dart';
import 'package:oly_elazm/features/home/logic/home_cubit.dart';
import 'package:oly_elazm/features/home/ui/home_view.dart';
import 'package:oly_elazm/features/settings/presentation/views/setting_view.dart';

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
    const PlaceholderScreen(title: 'Mosque Screen'),
    const PlaceholderScreen(title: 'Book Screen'),
    const PlaceholderScreen(title: 'Pray Screen'),
    const SettingView(),
  ];

  void _onItemTapped(int index) {
    if (index == 0 || index == 4) {
      setState(() {
        _selectedIndex = index;
      });
    }
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
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
