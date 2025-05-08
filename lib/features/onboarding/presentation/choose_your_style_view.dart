import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/features/onboarding/bloc/bloc.dart';
import 'package:fitted/features/onboarding/presentation/widgets/choose_your_fit.dart';
import 'package:fitted/features/onboarding/presentation/widgets/choose_your_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/choose_height.dart';

class ChooseYourStyleView extends StatelessWidget {
  const ChooseYourStyleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) => Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 82.h, bottom: 28),
              width: 1.sw,
              height: 6,
              alignment: Alignment.center,
              child: ListView.separated(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (context, index) => Spacers.spacer8,
                itemBuilder: (context, index) => Container(
                  width: 59,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(43.r),
                    color: index <= state.currentIndex
                        ? AppColors.orangePrimary
                        : AppColors.grey.withValues(
                            alpha: 0.4,
                          ),
                  ),
                ),
              ),
            ),
            onboardingWidgets[state.currentIndex]
          ],
        ),
      ),
    );
  }
}

List<Widget> onboardingWidgets = [
  ChooseYourStyleWidget(),
  ChooseYourFitWidget(),
  SetHeightWidget()
];
