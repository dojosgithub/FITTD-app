import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/assets/images.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/config/widgets/buttons/rounded/rounded_button.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:fitted/features/main/data/mock_data.dart';
import 'package:fitted/features/profile/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../config/widgets/product_card.dart';
import '../../../apparel/presentation/bloc/bloc.dart';
import '../bloc/bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfile());
    context.read<HomeBloc>().add(GetTrendingProducts());
    context.read<HomeBloc>().add(GetRecommendedProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 18, right: 18),
        child: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 12.w,
                  children: [
                    context.read<ProfileBloc>().state.profile.imageUrl == null
                        ? Container(
                            height: 48.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.grey,
                                width: 2,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: AppText.poppinsBold(
                              context
                                  .read<ProfileBloc>()
                                  .state
                                  .profile
                                  .name
                                  .toString()
                                  .substring(0, 2)
                                  .toUpperCase(),
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          )
                        : FittedImageProvider.circularNetwork(
                            imagePath: context
                                    .read<ProfileBloc>()
                                    .state
                                    .profile
                                    .imageUrl ??
                                HomeMockData.avatarImg,
                            imageSize: Size.square(48.w),
                            boxFit: BoxFit.cover,
                          ),
                    SizedBox(
                      width: 0.56.sw,
                      child: AppText.poppinsMedium(
                        "Hello ${context.read<ProfileBloc>().state.profile.name ?? ""}",
                        fontSize: 17,
                        height: 22 / 17,
                        color: AppColors.tealPrimary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    RoundedButton(
                      onTap: () {
                        context.pushNamed(AppRoutesEnum.notificationView.name);
                      },
                      child: FittedImageProvider.localSvg(
                        imagePath: AppVectors.notification,
                        imageSize: Size(18.w, 17.h),
                        boxFit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SpacersVertical.spacer2,
                GestureDetector(
                  onTap: () => context.pushNamed(AppRoutesEnum.searchView.name),
                  child: AbsorbPointer(
                    child: Hero(
                      tag: "searchField",
                      child: Material(
                        type: MaterialType.transparency,
                        child: FittedInputField.withIcon(
                          height: 48.h,
                          width: 1.sw,
                          hint: "Search for...",
                          hintStyle: AppTextStyles.poppinsRegular(
                            fontSize: 13,
                            height: 22 / 13,
                            color: AppColors.tealSecondary,
                          ),
                          label: "",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RoundedButton(
                              child: FittedImageProvider.localSvg(
                                imagePath: AppVectors.filter,
                                imageSize: Size(18.w, 17.h),
                                boxFit: BoxFit.contain,
                              ),
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: FittedImageProvider.localSvg(
                              imagePath: AppVectors.search,
                              imageSize: Size(8.w, 8.h),
                              boxFit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SpacersVertical.spacer40,
                Container(
                  width: 362.w,
                  height: 186.h,
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  decoration: BoxDecoration(
                    color: AppColors.tealPrimary,
                    borderRadius: BorderRadius.circular(9.r),
                    image: DecorationImage(
                        image: AssetImage(
                          AppImages.homeBanner,
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    spacing: 4.h,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10.h,
                        children: [
                          AppText.poppinsRegular(
                            "Welcome Back",
                            fontSize: 23,
                            height: 22 / 23,
                            color: AppColors.white,
                          ),
                          AppText.poppinsRegular(
                            "Let’s find the perfect fit",
                            fontSize: 16,
                            height: 24 / 16,
                            color: AppColors.tealSecondary,
                          ),
                        ],
                      ),
                      CustomButton(
                        text: "Start Shopping",
                        textStyle: AppTextStyles.poppinsSemiBold(
                          fontSize: 13,
                          height: 24 / 13,
                          color: AppColors.white,
                        ),
                        width: 148.w,
                        height: 44.h,
                      ),
                    ],
                  ),
                ),
                SpacersVertical.spacer56,
                AppText.poppinsRegular(
                  "Brands you love",
                  fontSize: 27,
                  height: 22 / 27,
                  color: AppColors.tealPrimary,
                ),
                SpacersVertical.spacer12,
                GridView.builder(
                  itemCount: brands.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20.w,
                    crossAxisCount: 3,
                    childAspectRatio: 1.4,
                  ),
                  itemBuilder: (context, index) {
                    return (index == 6 || index == 8)
                        ? SizedBox.shrink()
                        : GestureDetector(
                            onTap: () {
                              context.read<ApparelBloc>().add(
                                    SetBrand(
                                      brand: brands[index]['name'],
                                    ),
                                  );
                              context.pushNamed(
                                AppRoutesEnum.main.name,
                                extra: {"index": 1},
                              );
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.only(top: index == 1 ? 18.h : 0),
                              child: FittedImageProvider.localSvg(
                                imagePath: brands[index]['icon'],
                              ),
                            ),
                          );
                  },
                ),
                AppText.poppinsRegular(
                  "Trending",
                  fontSize: 27,
                  height: 22 / 27,
                  color: AppColors.tealPrimary,
                ),
                SpacersVertical.spacer36,
                if (state.trendingProductsEntity != null)
                  GridView.builder(
                    itemCount: state.trendingProductsEntity!.products.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 162.w / 270.h,
                    ),
                    itemBuilder: (context, index) {
                      final product =
                          state.trendingProductsEntity!.products[index];
                      return ProductCard(
                          name: product.name,
                          price: product.price,
                          id: product.id,
                          isLiked: product.isWishlist,
                          image: product.imageUrl,
                          alterationRequired: false,
                          onTap: () {
                            context.read<ApparelBloc>().add(
                                  WishList(
                                    productId: product.id,
                                    isAdded: product.isWishlist,
                                    skip: true,
                                  ),
                                );
                            context
                                .read<HomeBloc>()
                                .add(EditWishlist(index: index));
                          });
                    },
                  ),
                SpacersVertical.spacer36,
                AppText.poppinsRegular(
                  "Recommendation",
                  fontSize: 27,
                  height: 22 / 27,
                  color: AppColors.tealPrimary,
                ),
                SpacersVertical.spacer40,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.r),
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.homeRecommended,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    width: 1.sw,
                    height: 450.h,
                    padding: EdgeInsets.symmetric(
                      vertical: 30.h,
                      horizontal: 15.w,
                    ),
                    alignment: Alignment.bottomLeft,
                    color: AppColors.black.withValues(alpha: 0.1),
                    child: AppText.poppinsLight(
                      "Recommended For You",
                      fontSize: 38,
                      height: 42 / 38,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                SpacersVertical.spacer30,
                if (state.recommendedProductsEntity != null)
                  GridView.builder(
                    itemCount: state.recommendedProductsEntity!.products.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 162.w / 270.h,
                    ),
                    itemBuilder: (context, index) {
                      final product =
                          state.recommendedProductsEntity!.products[index];
                      return ProductCard(
                        name: product.name,
                        price: product.price,
                        id: product.id,
                        isLiked: product.isWishlist,
                        image: product.imageUrl,
                        alterationRequired: false,
                        onTap: () {
                          context.read<ApparelBloc>().add(
                                WishList(
                                  productId: product.id,
                                  isAdded: product.isWishlist,
                                  skip: true,
                                ),
                              );
                          context.read<HomeBloc>().add(
                                EditWishlist(
                                  index: index,
                                  isTrending: false,
                                ),
                              );
                        },
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

final List brands = [
  {
    "icon": AppVectors.agolde,
    "name": "Agolde",
    "displayName": "Agolde",
  },
  {
    "icon": AppVectors.ebDenim,
    "name": "EB_Denim",
    "displayName": "EB Denim",
  },
  {
    "icon": AppVectors.jcrew,
    "name": "J_Crew",
    "displayName": "J Crew",
  },
  {
    "icon": AppVectors.reformation,
    "name": "Reformation",
    "displayName": "Reformation",
  },
  {
    "icon": AppVectors.houseOfCb,
    "name": "House_Of_CB",
    "displayName": "House Of CB",
  },
  {
    "icon": AppVectors.lululemon,
    "name": "Lululemon",
    "displayName": "Lululemon",
  },
  {},
  {
    "icon": AppVectors.selfPortrait,
    "name": "Self_Potrait",
    "displayName": "Self Potrait",
  },
  {},
];
