import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseYourStyleWidget extends StatelessWidget {
  const ChooseYourStyleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText.poppinsMedium(
          "Choose your style",
          fontSize: 25,
          height: 32 / 25,
          color: AppColors.tealPrimary,
        ),
        SpacersVertical.spacer18,
        Opacity(
          opacity: 0.6,
          child: SizedBox(
            width: 330.w,
            child: AppText.poppinsRegular(
              "Answer a few questions, and we'll suggest clothing items tailored to your size",
              fontSize: 14,
              height: 22 / 14,
              color: Colors.black,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SpacersVertical.spacer30,
        SizedBox(
          width: 342.w,
          child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: styleList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SpacersVertical.spacer16,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => context.read<MeasurementBloc>().add(
                        SelectStyle(
                          style: styleList[index]['value'],
                        ),
                      ),
                  child: Container(
                    width: 342.w,
                    height: 122.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(
                            styleList[index]['image'],
                          ),
                          fit: BoxFit.cover),
                    ),
                    alignment: Alignment.center,
                    child: AppText.poppinsMedium(
                      styleList[index]['title'],
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

List<Map> styleList = [
  {
    "image": AppImages.men,
    "title": "MENS",
    "value": "male",
  },
  {
    "image": AppImages.women,
    "title": "WOMENS",
    "value": "female",
  },
  // {
  //   "image": AppImages.women,
  //   "title": "UNISEX",
  //   "value": "unisex",
  // },
];
