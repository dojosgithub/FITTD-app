import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/helper/image_provider/fitted_image_provider.dart';

class ShowPickedImage extends StatelessWidget {
  const ShowPickedImage({
    required this.image,
    super.key,
  });
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      height: 170.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          DottedBorder(
            radius: Radius.circular(14.r),
            borderType: BorderType.RRect,
            dashPattern: const [10, 6],
            strokeWidth: 1.4,
            color: AppColors.orangePrimary,
            child: Container(
              color: Color(0xffEBFFFA),
              width: 325.w,
              child: FittedImageProvider.roundedRect(
                childImageType: AppImageType.file,
                imagePath: image!.path,
                // boxFit: BoxFit.cover,
                imageSize: Size(219.w, 150.h),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          Positioned(
            top: 5.h,
            right: 0,
            child: GestureDetector(
              onTap: () {
                // context.read<MeasurementBloc>().add(ClearImage());
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.orangePrimary,
                ),
                child: Icon(
                  Icons.close,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
