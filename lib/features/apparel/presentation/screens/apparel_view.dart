import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/apparel/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../widgets/apparel_header.dart';

class ApparelView extends StatefulWidget {
  const ApparelView({super.key});

  @override
  State<ApparelView> createState() => _ApparelViewState();
}

class _ApparelViewState extends State<ApparelView> {
  @override
  void initState() {
    context.read<ApparelBloc>().add(GetApparelEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ApparelBloc, ApparelState>(
        builder: (context, state) => state.isLoading
            ? LoadingIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 22.0, left: 18, right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ApparelHeader(),
                      SpacersVertical.spacer56,
                      AppText.poppinsRegular(
                        "Apparel",
                        fontSize: 27,
                        height: 22 / 27,
                        color: AppColors.tealPrimary,
                      ),
                      SpacersVertical.spacer36,
                      GridView.builder(
                        itemCount: state.apparelEntity?.length ?? 0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 175 / 240,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.read<ApparelBloc>().add(
                                    SetCategory(
                                      category:
                                          state.apparelEntity![index].label,
                                    ),
                                  );
                              context.pushNamed(
                                AppRoutesEnum.main.name,
                                extra: {"index": 4},
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 171.w,
                                  height: 195.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9.r),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors.black
                                          .withValues(alpha: 0.04),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  child: FittedImageProvider.localAsset(
                                    imagePath: apparelImages[
                                        state.apparelEntity![index].label],
                                    imageSize: Size(107.w, 163.h),
                                    boxFit: BoxFit.cover,
                                  ),
                                ),
                                SpacersVertical.spacer8,
                                Padding(
                                  padding: EdgeInsets.all(4.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText.poppinsMedium(
                                        state.apparelEntity![index].label,
                                        fontSize: 14,
                                        height: 22 / 14,
                                        color: AppColors.tealPrimary,
                                      ),
                                      AppText.poppinsRegular(
                                        state.apparelEntity![index].count
                                            .toString(),
                                        fontSize: 12,
                                        height: 22 / 12,
                                        color: AppColors.tealSecondary,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
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

final Map apparelImages = {
  "Denim": AppImages.denims,
  "Bottoms": AppImages.bottoms,
  "Tops": AppImages.tops,
  "Outerwear": AppImages.outerwear,
  "Dresses": AppImages.dresses,
  "Footwear": AppImages.footwear,
  "Accessories": AppImages.accessories,
};
