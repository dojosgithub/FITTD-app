import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/storage/app_storage.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fitted/config/router/enum/app_routes_enum.dart';
import '../bloc/bloc.dart';

class RecentSearchesWidget extends StatelessWidget {
  const RecentSearchesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        AppText.poppinsSemiBold(
          "Recent searches",
          fontSize: 16,
          color: AppColors.black,
        ),
        if (SharedPrefsStorage.getRecentSearchesList().isNotEmpty)
          SizedBox(
            width: 1.sw,
            height: 107.h,
            child: ListView.separated(
              itemCount: SharedPrefsStorage.getRecentSearchesList().length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => Spacers.spacer16,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context.read<SearchBloc>().add(SearchProducts(
                      keyword: SharedPrefsStorage.getRecentSearchesList()[index]
                              ['keyword']
                          .toString()));
                  context.pushNamed(AppRoutesEnum.searchResultsView.name);
                  context.read<SearchBloc>().add(Reset());
                },
                child: Column(
                  spacing: 10.h,
                  children: [
                    SharedPrefsStorage.getRecentSearchesList()[index]
                                ['image'] ==
                            ""
                        ? SizedBox.square(
                            dimension: 52.w,
                            child: Icon(Icons.image, color: AppColors.grey),
                          )
                        : FittedImageProvider.roundedRect(
                            imagePath: SharedPrefsStorage
                                .getRecentSearchesList()[index]['image'],
                            childImageType: AppImageType.network,
                            boxFit: BoxFit.cover,
                            imageSize: Size(52.w, 52.h),
                            borderRadius: BorderRadius.circular(180.r),
                          ),
                    SizedBox(
                      width: 52.w,
                      child: AppText.poppinsMedium(
                        SharedPrefsStorage.getRecentSearchesList()[index]
                                ['keyword']
                            .toString(),
                        fontSize: 14,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        color: AppColors.black.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
