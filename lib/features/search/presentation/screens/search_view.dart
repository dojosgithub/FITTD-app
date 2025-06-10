import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/input_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/brands_you_love.dart';
import '../widgets/most_popular_brands.dart';
import '../widgets/recent_searches.dart';
import '../widgets/search_field.dart';
import '../widgets/search_suggestions.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(controller: controller),
            controller.text != ""
                ? BuildSearchSuggestions()
                : Column(
                    children: [
                      SpacersVertical.spacer36,
                      RecentSearchesWidget(),
                      SpacersVertical.spacer22,
                      MostPopularBrandsWidget(),
                      SpacersVertical.spacer22,
                      BrandsYouLoveWidget(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
