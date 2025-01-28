import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oly_elazm/features/quran/surahtile.dart';
import 'package:oly_elazm/features/quran/utils/helpers/custom_icon_button.dart';
import 'package:oly_elazm/features/quran/utils/helpers/custom_text.dart';
import 'package:quran/quran.dart' as quran;

import 'utils/globals.dart';
import 'utils/helpers/application_title.dart';

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
              // const SizedBox(height: 20),
              // Container(
              //   padding: const EdgeInsets.all(8.0),
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       gradient: LinearGradient(
              //           colors: <Color>[white, purple],
              //           begin: AlignmentDirectional.bottomEnd,
              //           end: AlignmentDirectional.bottomEnd,
              //           tileMode: TileMode.clamp)),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           Row(
              //             mainAxisSize: MainAxisSize.min,
              //             children: <Widget>[
              //               Icon(FontAwesomeIcons.bookOpen,
              //                   size: 20, color: white),
              //               SizedBox(width: 10),
              //               CustomizedText(
              //                   text: "Last Read",
              //                   color: white,
              //                   fontSize: 20),
              //             ],
              //           ),
              //           const SizedBox(height: 20),
              //           CustomizedText(
              //               text: quran.getSurahName(surah),
              //               color: white,
              //               fontSize: 20,
              //               fontWeight: FontWeight.bold),
              //           const SizedBox(height: 10),
              //           CustomizedText(
              //               text:
              //                   "Ayah No : ${Random().nextInt(quran.getVerseCount(surah)) + 1}",
              //               color: white,
              //               fontSize: 18),
              //         ],
              //       ),
              //       const Spacer(),
              //       Image.asset("assets/images/book.png",
              //           width: MediaQuery.of(context).size.width * .4,
              //           height: MediaQuery.of(context).size.height * .4),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 10),
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
