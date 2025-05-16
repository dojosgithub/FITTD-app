import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/bloc.dart';

class ChooseYourFitWidget extends StatelessWidget {
  const ChooseYourFitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 94.h,
      children: [
        AppText.poppinsMedium(
          "Choose your fit",
          fontSize: 25,
          height: 32 / 25,
          color: AppColors.tealPrimary,
        ),
        SizedBox(
          width: 342.w,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: fitList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SpacersVertical.spacer16,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => context.read<MeasurementBloc>().add(
                        SelectFit(
                          fit: fitList[index]['value'],
                        ),
                      ),
                  child: Container(
                    width: 342.w,
                    height: 122.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(
                            fitList[index]['image'],
                          ),
                          fit: BoxFit.cover),
                    ),
                    alignment: Alignment.center,
                    child: AppText.poppinsMedium(
                      fitList[index]['title'],
                      fontSize: 25,
                      height: 32 / 25,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

List<Map> fitList = [
  {
    "image": AppImages.tight,
    "title": "TIGHT",
    "value": "tight",
  },
  {
    "image": AppImages.loose,
    "title": "LOOSE",
    "value": "loose",
  },
  {
    "image": AppImages.fit,
    "title": "FITTED",
    "value": "fit",
  },
];
