import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/product_card.dart';
import 'package:fitted/features/main/data/mock_data.dart';
import 'package:fitted/features/products/presentation/widgets/fit_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class SearchResultsView extends StatelessWidget {
  const SearchResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    "Jeans Men",
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
                    "Search Results(15)",
                    fontSize: 16,
                    color: AppColors.deepBurgundy,
                  ),
                  FittedImageProvider.localSvg(
                    imagePath: AppVectors.filterOrange,
                  )
                ],
              ),
              FitSection(
                fitType: "fitted",
                showHeading: false,
              ),
              SpacersVertical.spacer30,
              GridView.builder(
                itemCount: 20,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 162.w / 240.h,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: "product.name",
                    price: "product.price",
                    id: "product.id",
                    isLiked: true,
                    image: HomeMockData.productImg1,
                    onTap: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
