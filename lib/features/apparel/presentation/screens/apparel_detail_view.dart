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

class ApparelDetailView extends StatefulWidget {
  const ApparelDetailView({super.key});

  @override
  State<ApparelDetailView> createState() => _ApparelDetailViewState();
}

class _ApparelDetailViewState extends State<ApparelDetailView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      final bloc = context.read<ApparelBloc>();
      if (!bloc.state.isLoading && bloc.state.hasMore) {
        bloc.add(LoadMoreCategoryProducts());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ApparelBloc, ApparelState>(
        builder: (context, state) => state.isLoading &&
                state.productsEntity == null
            ? LoadingIndicator()
            : SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 22.0,
                    left: 18,
                    right: 18,
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
                      SpacersVertical.spacer34,
                      GridView.builder(
                        itemCount: state.productsEntity?.length ?? 0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 162.w / 290.h,
                        ),
                        itemBuilder: (context, index) {
                          final product = state.productsEntity![index];
                          return ProductCard(
                            name: product.name,
                            price: product.price,
                            id: product.id,
                            isLiked: product.isWishlist,
                            image: product.imageUrl,
                            onTap: () => context.read<ApparelBloc>().add(
                                  WishList(
                                    productId: product.id,
                                    isAdded: product.isWishlist,
                                  ),
                                ),
                          );
                        },
                      ),
                      if (state.isLoading) Center(child: LoadingIndicator()),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

// List filterList = ["Bags", "\$20-\$15 000", "Medium"];


//Filter Section


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



// Search Bar

   // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      // RoundedButton(
                      //   child: FittedImageProvider.localSvg(
                      //     imagePath: AppVectors.filterBar,
                      //   ),q
                      // ),    //   ],
                      // ),