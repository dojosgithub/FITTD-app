import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/helper/spacers/spacers.dart';
import '../../../../config/widgets/app_text.dart';
import '../../../../config/widgets/input_feild.dart';
import '../../../../config/widgets/product_card.dart';
import '../bloc/bloc.dart';
import '../widgets/apparel_header.dart';

class ApparelDetailView extends StatelessWidget {
  const ApparelDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ApparelBloc, ApparelState>(
        builder: (context, state) => state.isLoading
            ? LoadingIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 22.0,
                    left: 18,
                    right: 18,
                    bottom: 80.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ApparelHeader(),
                      SpacersVertical.spacer44,
                      AppText.poppinsRegular(
                        "Apparel",
                        fontSize: 27,
                        height: 22 / 27,
                        color: AppColors.tealPrimary,
                      ),
                      SpacersVertical.spacer22,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      // RoundedButton(
                      //   child: FittedImageProvider.localSvg(
                      //     imagePath: AppVectors.filterBar,
                      //   ),q
                      // ),
                      FittedInputField.withIcon(
                        height: 48.h,
                        width: 1.sw,
                        hint: "Search ",
                        hintStyle: AppTextStyles.poppinsRegular(
                          fontSize: 13,
                          height: 22 / 13,
                          color: AppColors.tealSecondary,
                        ),
                        label: "",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: FittedImageProvider.localSvg(
                            imagePath: AppVectors.search,
                            imageSize: Size(8.w, 8.h),
                            boxFit: BoxFit.contain,
                          ),
                        ),
                      ),
                      //   ],
                      // ),
                      SpacersVertical.spacer52,
                      // AppText.poppinsMedium(
                      //   "Applied filters:",
                      //   fontSize: 22,
                      //   color: AppColors.tealPrimary,
                      // ),
                      // SpacersVertical.spacer34,
                      // SizedBox(
                      //   height: 37.h,
                      //   child: ListView.separated(
                      //     padding: EdgeInsets.zero,
                      //     shrinkWrap: true,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     itemCount: filterList.length,
                      //     scrollDirection: Axis.horizontal,
                      //     separatorBuilder: (context, index) => Spacers.spacer10,
                      //     itemBuilder: (context, index) {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(40.r),
                      //           border: Border.all(
                      //             color: AppColors.grey,
                      //             width: 1,
                      //           ),
                      //         ),
                      //         padding: EdgeInsets.symmetric(horizontal: 18),
                      //         alignment: Alignment.center,
                      //         child: Row(
                      //           spacing: 4.w,
                      //           children: [
                      //             AppText.poppinsMedium(
                      //               filterList[index],
                      //               fontSize: 12,
                      //               color: AppColors.tealPrimary,
                      //             ),
                      //             Icon(
                      //               Icons.close,
                      //               color: AppColors.tealSecondary,
                      //               size: 18,
                      //             )
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      SpacersVertical.spacer34,
                      GridView.builder(
                        itemCount: state.productsEntity!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 162 / 260,
                        ),
                        itemBuilder: (context, index) {
                          return ProductCard(
                            name: state.productsEntity![index].name,
                            price: state.productsEntity![index].price,
                            isLiked: state.productsEntity![index].isWishlist,
                            image: state.productsEntity![index].imageUrl,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

// List filterList = ["Bags", "\$20-\$15 000", "Medium"];
