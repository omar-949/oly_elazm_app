import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oly_elazm/features/quran/surahtile.dart';
import 'package:quran/quran.dart' as quran;

import 'utils/globals.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final int surah = Random().nextInt(114) + 1;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      SurahTile(number: index + 1),
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          decoration: BoxDecoration(
                              color: white.withOpacity(.8),
                              borderRadius: BorderRadius.circular(15))),
                  itemCount: quran.totalSurahCount,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
