import 'package:dotted_border/dotted_border.dart';
import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/helper/image_provider/fitted_image_provider.dart';

class ShowImagePicker extends StatelessWidget {
  const ShowImagePicker({
    super.key,
    required this.image,
  });
  final XFile? image;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      radius: Radius.circular(14.r),
      borderType: BorderType.RRect,
      dashPattern: const [10, 6],
      strokeWidth: 1.4,
      color: AppColors.orangePrimary,
      child: GestureDetector(
        onTap: image != null
            ? null
            : () {
                // showModalBottomSheet(
                //     context: context,
                //     isScrollControlled: true,
                //     backgroundColor: Colors.transparent,
                //     builder: (ctx) => DraggableScrollableSheet(
                //         initialChildSize: 0.5,
                //         minChildSize: 0.5,
                //         maxChildSize: 0.5,
                //         builder: (ctx, scrollController) {
                //   return BottomSheet(
                //       enableDrag: false,
                //       showDragHandle: false,
                //       backgroundColor: Colors.white,
                //       onClosing: () {},
                //       builder: (ctx) {
                //         return PickImageBottomSheet(
                //           onCamera: () {
                //             context.pop();
                //             context
                //                 .read<MeasurementBloc>()
                //                 .add(PickFromCamera());
                //           },
                //           onGallery: () {
                //             context.pop();
                //             context
                //                 .read<MeasurementBloc>()
                //                 .add(PickFromGallery());
                //           },
                //         );
                //       });
                // }));
              },
        child: Container(
          width: 325.w,
          height: 150.h,
          decoration: BoxDecoration(
            color: Color(0xffEBFFFA),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              FittedImageProvider.localSvg(
                imagePath: AppVectors.uploadColored,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.poppinsBold(
                    "Click here",
                    fontSize: 12,
                    height: 16 / 12,
                    color: AppColors.orangePrimary,
                  ),
                  AppText.poppinsRegular(
                    " to add image",
                    fontSize: 12,
                    height: 16 / 12,
                    color: AppColors.black,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
