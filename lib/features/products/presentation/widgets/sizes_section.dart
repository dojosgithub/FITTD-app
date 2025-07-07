import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/product_detail_entity.dart';

class BuildSizes extends StatefulWidget {
  const BuildSizes({
    super.key,
    required this.sizesList,
    required this.recommendedSize,
  });

  final List<ProductSizeEntity> sizesList;
  final String recommendedSize;

  @override
  State<BuildSizes> createState() => _BuildSizesState();
}

class _BuildSizesState extends State<BuildSizes> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final index = widget.sizesList
          .indexWhere((size) => size.size == widget.recommendedSize);
      if (index != -1) {
        _scrollToIndex(index);
      }
    });
  }

  void _scrollToIndex(int index) {
    final itemWidth = 80.w + 6.w;
    final offset = index * itemWidth;

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.poppinsRegular(
          "Select Size",
          fontSize: 22,
          color: AppColors.tealPrimary,
        ),
        SpacersVertical.spacer18,
        SizedBox(
          width: 1.sw,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                widget.sizesList.length,
                (index) => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: index == 0 ? 0 : 6.w),
                  child: SizedBox(
                    height: 115,
                    child: Stack(
                      children: [
                        Container(
                          width: 90.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            color: widget.sizesList[index].size ==
                                    widget.recommendedSize
                                ? AppColors.orangeSecondary.withAlpha(77)
                                : const Color(0xffFAFAFA),
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                              width: 1,
                              color: widget.sizesList[index].size ==
                                      widget.recommendedSize
                                  ? AppColors.orangePrimary
                                  : AppColors.black.withAlpha(10),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText.poppinsRegular(
                                widget.sizesList[index].size
                                    .replaceAll('#', ' '),
                                fontSize: 22,
                                color: AppColors.tealPrimary,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                              ),
                              if (!widget.sizesList[index].inStock)
                                AppText.poppinsRegular(
                                  "(Out of Stock)",
                                  fontSize: 10,
                                  color: AppColors.tealSecondary,
                                ),
                            ],
                          ),
                        ),
                        if (widget.sizesList[index].size ==
                            widget.recommendedSize)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                width: 67.w,
                                height: 21.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.r),
                                  color: AppColors.orangePrimary,
                                ),
                                alignment: Alignment.center,
                                child: AppText.poppinsMedium(
                                  "Great Fit",
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
