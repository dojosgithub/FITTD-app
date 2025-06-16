import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/bottomsheet/filter_by_bottom_sheet.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/config/widgets/product_card.dart';
import 'package:fitted/features/products/presentation/widgets/fit_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../bloc/bloc.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) => state.searchProductEntity == null
            ? LoadingIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 48.h,
                    left: 12.w,
                    right: 12.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => context.pop(),
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                          AppText.poppinsMedium(
                            state.selectedQuery,
                            fontSize: 16,
                            height: 24 / 16,
                            color: AppColors.deepBurgundy,
                          ),
                        ],
                      ),
                      SpacersVertical.spacer6,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.poppinsSemiBold(
                            "Search Results(${state.searchProductEntity!.length})",
                            fontSize: 16,
                            color: AppColors.deepBurgundy,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (ctx) => DraggableScrollableSheet(
                                  expand: false,
                                  initialChildSize: 0.27,
                                  minChildSize: 0.27,
                                  maxChildSize: 0.27,
                                  builder: (ctx, scrollController) {
                                    return BottomSheet(
                                      enableDrag: false,
                                      showDragHandle: false,
                                      backgroundColor: Colors.white,
                                      onClosing: () {},
                                      builder: (ctx) {
                                        return FilterByBottomSheet();
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                            child: FittedImageProvider.localSvg(
                              imagePath: AppVectors.filterOrange,
                            ),
                          )
                        ],
                      ),
                      if (state.filterList[0]['isSelected'])
                        FitSection(
                          fitType: state.fitType,
                          showHeading: false,
                        ),
                      SpacersVertical.spacer30,
                      GridView.builder(
                        itemCount: state.searchProductEntity!.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 162.w / 290.h,
                        ),
                        itemBuilder: (context, index) {
                          final product = state.searchProductEntity![index];
                          return ProductCard(
                            name: product.name,
                            price: product.price,
                            id: product.id,
                            isLiked: product.isWishlist,
                            image: product.imageUrl,
                            alterationRequired: product.alterationRequired,
                            onTap: () {},
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
