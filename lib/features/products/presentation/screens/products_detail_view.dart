import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/products/presentation/bloc/bloc.dart';
import 'package:fitted/features/products/presentation/widgets/product_detail_header.dart';
import 'package:fitted/features/products/presentation/widgets/similar_products_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import '../widgets/alteration_section.dart';
import '../widgets/buy_now_button.dart';
import '../widgets/fit_section.dart';
import '../widgets/image_carousal.dart';
import '../widgets/info_row.dart';
import '../widgets/rating_row.dart';
import '../widgets/sizes_section.dart';

class ProductsDetailView extends StatefulWidget {
  const ProductsDetailView({super.key, required this.productId});
  final String productId;
  @override
  State<ProductsDetailView> createState() => _ProductsDetailViewState();
}

class _ProductsDetailViewState extends State<ProductsDetailView> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(
          GetProductDetails(
            productId: widget.productId,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductsBloc, ProductState>(
          builder: (context, state) {
            if (state.isLoading) {
              return LoadingIndicator();
            } else {
              final productEntity = state.productDetailEntity!;
              final product = productEntity.product;

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 18, right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDetailHeader(),
                      ProductImageCarousel(imageUrls: product.image.secondary),
                      SpacersVertical.spacer12,
                      AppText.poppinsMedium(
                        (product.brand).contains("_")
                            ? "${product.brand.split("_")[0]} ${product.brand.split("_")[1]}"
                            : product.brand,
                        fontSize: 16,
                        height: 24 / 16,
                        color: AppColors.charcoal.withValues(alpha: 0.8),
                      ),
                      SpacersVertical.spacer12,
                      InfoRow(product: product),
                      SpacersVertical.spacer8,
                      if ((product.rating) != null &&
                          (product.reviewCount) != null) ...[
                        RatingRow(product: product),
                        SpacersVertical.spacer42,
                      ],
                      FitSection(
                        fitType: productEntity.fitType,
                      ),
                      SpacersVertical.spacer36,
                      if (productEntity.recommendedSize != null)
                        BuildSizes(
                          sizesList: product.sizes,
                          recommendedSize: productEntity.recommendedSize!,
                        ),
                      SpacersVertical.spacer18,
                      AppText.poppinsRegular(
                        "Description",
                        fontSize: 22,
                        color: AppColors.tealPrimary,
                      ),
                      Html(data: product.description),
                      SpacersVertical.spacer16,
                      if (productEntity.alterationRequired ??
                          false || productEntity.attributeDifferences != null)
                        AlterationSection(
                          attributeDifferences:
                              productEntity.attributeDifferences!,
                          gender: product.gender,
                        ),
                      SpacersVertical.spacer40,
                      AppText.poppinsRegular(
                        "You may also like",
                        fontSize: 22,
                        color: AppColors.tealPrimary,
                      ),
                      SpacersVertical.spacer18,
                      SimilarProductsSection(
                        similarProducts: productEntity.similarProducts,
                      ),
                      SpacersVertical.spacer28,
                      BuyNowButton(price: product.price),
                      SpacersVertical.spacer64
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
