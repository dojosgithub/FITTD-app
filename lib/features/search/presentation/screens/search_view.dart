import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/loading_indicator.dart';
import 'package:fitted/features/search/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 30.h,
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchField(controller: controller),
                  controller.text != ""
                      ? state.suggestionEntity == null
                          ? LoadingIndicator()
                          : state.suggestionEntity!.isEmpty
                              ? Container(
                                  height: 0.7.sw,
                                  alignment: Alignment.bottomCenter,
                                  child: AppText.poppinsBold(
                                    "NO RESULTS FOUND",
                                    fontSize: 18,
                                    color: AppColors.black,
                                  ),
                                )
                              : BuildSearchSuggestions(
                                  suggestions: state.suggestionEntity!,
                                )
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
          ),
        ),
      ),
    );
  }
}
