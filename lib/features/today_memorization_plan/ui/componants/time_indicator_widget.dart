import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oly_elazm/features/today_memorization_plan/ui/componants/time_row.dart';
import '../../../../../../../../core/helpers/app_size.dart';
import 'background_svg.dart';

class TimeIndicatorWidget extends StatefulWidget {
  final DateTime time;

  const TimeIndicatorWidget({super.key, required this.time});

  @override
  TimeIndicatorWidgetState createState() => TimeIndicatorWidgetState();
}

class TimeIndicatorWidgetState extends State<TimeIndicatorWidget> {
  late Duration _remainingTime;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _updateRemainingTime();

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _updateRemainingTime();
        });
      }
    });
  }

  void _updateRemainingTime() {
    final now = DateTime.now();
    _remainingTime = widget.time.difference(now);

    if (_remainingTime.isNegative) {
      _countdownTimer?.cancel();
      _remainingTime = Duration.zero;
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _remainingTime.inHours.remainder(24).toString().padLeft(2, '0');
    final minutes = _remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0');

    return Stack(
      children: [
        const BackgroundSvg(assetPath: 'assets/svgs/Group.svg'),
        Positioned(
          top: AppSize.h15,
          left: AppSize.w15,
          right: AppSize.w15,
          child: TimeRow(
            hours: hours,
            minutes: minutes,
          ),
        ),
      ],
    );
  }
}
