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
import '../../../search/domain/entity/search_product_entity.dart';
import '../../../search/presentation/widgets/search_suggestions.dart';
import '../../domain/entities/category_products_entity.dart';
import '../bloc/bloc.dart';
import '../widgets/apparel_header.dart';

class ApparelDetailView extends StatefulWidget {
  const ApparelDetailView({super.key});

  @override
  State<ApparelDetailView> createState() => _ApparelDetailViewState();
}

class _ApparelDetailViewState extends State<ApparelDetailView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController controller = TextEditingController();

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
        builder: (context, state) {
          if (state.isLoading && state.productsEntity == null) {
            return LoadingIndicator();
          }

          final List<Object> products = state.searchQuery.isNotEmpty
              ? (state.searchProductEntity ?? [])
              : (state.productsEntity ?? []);

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 22.0, left: 18, right: 18),
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
                        controller: controller,
                        hintStyle: AppTextStyles.poppinsRegular(
                          fontSize: 13,
                          height: 22 / 13,
                          color: AppColors.tealSecondary,
                        ),
                        onFieldSubmitted: (p0) =>
                            context.read<ApparelBloc>().add(
                                  SearchProducts(keyword: p0),
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
                        suffixIcon: controller.text.isNotEmpty
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<ApparelBloc>()
                                        .add(SearchQuery(query: ""));
                                    controller.clear();
                                  },
                                  child: FittedImageProvider.localSvg(
                                    imagePath: AppVectors.cross,
                                    imageSize: Size(8.w, 8.h),
                                    boxFit: BoxFit.contain,
                                  ),
                                ),
                              )
                            : null,
                        onChanged: (value) => context
                            .read<ApparelBloc>()
                            .add(SearchQuery(query: value)),
                      ),
                      SpacersVertical.spacer34,
                    ],
                  ),
                ),
              ),
              if (state.searchQuery.isNotEmpty &&
                  (state.searchProductEntity?.isEmpty ?? true) &&
                  state.suggestionEntity != null)
                SliverToBoxAdapter(
                  child: state.suggestionEntity!.isNotEmpty
                      ? BuildSearchSuggestions(
                          suggestions: state.suggestionEntity!,
                          isApparel: true,
                        )
                      : state.isLoading
                          ? SizedBox.shrink()
                          : Container(
                              height: 0.5.sw,
                              alignment: Alignment.bottomCenter,
                              child: AppText.poppinsBold(
                                "NO RESULTS FOUND",
                                fontSize: 18,
                                color: AppColors.black,
                              ),
                            ),
                ),
              if (products.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = products[index];
                        return _buildProductCard(product);
                      },
                      childCount: products.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 162.w / 290.h,
                    ),
                  ),
                ),
              if (state.isLoading)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: LoadingIndicator()),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  Widget _buildProductCard(Object product) {
    final name = product is ProductEntity
        ? product.name
        : product is SearchProductEntity
            ? product.name
            : '';

    final price = product is ProductEntity
        ? product.price
        : product is SearchProductEntity
            ? product.price
            : '';

    final id = product is ProductEntity
        ? product.id
        : product is SearchProductEntity
            ? product.id
            : '';

    final isLiked = product is ProductEntity
        ? product.isWishlist
        : product is SearchProductEntity
            ? product.isWishlist
            : false;

    final image = product is ProductEntity
        ? product.imageUrl
        : product is SearchProductEntity
            ? product.imageUrl
            : '';

    final alterationRequired =
        product is SearchProductEntity ? product.alterationRequired : false;

    return ProductCard(
      name: name,
      price: price,
      id: id,
      isLiked: isLiked,
      image: image,
      alterationRequired: alterationRequired,
      onTap: () => context.read<ApparelBloc>().add(
            WishList(productId: id, isAdded: isLiked),
          ),
    );
  }
}
