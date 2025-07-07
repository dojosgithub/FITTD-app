import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/router/app_routes.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/apparel/presentation/bloc/bloc.dart'
    as apparel_bloc;
import 'package:fitted/features/search/domain/entity/search_suggestion_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../bloc/bloc.dart';

class BuildSearchSuggestions extends StatelessWidget {
  const BuildSearchSuggestions(
      {super.key, required this.suggestions, this.isApparel = false});

  final List<SuggestionEntity> suggestions;
  final bool isApparel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: suggestions.length,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: isApparel ? 0 : 18.h,
      ),
      separatorBuilder: (context, index) => Divider(
        height: 24.h,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: isApparel
            ? () {
                context.read<apparel_bloc.ApparelBloc>().add(
                      apparel_bloc.SearchProducts(
                        keyword: suggestions[index]
                            .name
                            .replaceAll(RegExp(r'\s+'), ' ')
                            .trim(),
                      ),
                    );
              }
            : () {
                context.read<SearchBloc>().add(
                      SearchProducts(
                        keyword: suggestions[index]
                            .name
                            .replaceAll(RegExp(r'\s+'), ' ')
                            .trim(),
                      ),
                    );
                context.pushNamed(AppRoutesEnum.searchResultsView.name);
                context.read<SearchBloc>().add(Reset());
              },
        child: Row(
          spacing: 18.w,
          children: [
            FittedImageProvider.localSvg(
              imagePath: AppVectors.search,
              imageSize: Size(16.w, 16.h),
              boxFit: BoxFit.contain,
            ),
            Expanded(
              child: AppText.poppinsSemiBold(
                suggestions[index].name.replaceAll(RegExp(r'\s+'), ' ').trim(),
                fontSize: 16,
                height: 24 / 16,
                color: AppColors.deepBurgundy,
              ),
            ),
            FittedImageProvider.localSvg(
              imagePath: AppVectors.chevronRight,
              imageSize: Size(16.w, 16.h),
              boxFit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
