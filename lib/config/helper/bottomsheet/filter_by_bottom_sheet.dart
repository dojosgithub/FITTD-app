import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/search/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FilterByBottomSheet extends StatelessWidget {
  const FilterByBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) => Container(
        margin: EdgeInsets.only(
          top: 35.h,
          left: 14.w,
          right: 14.w,
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.poppinsBold(
              "Filter by",
              fontSize: 20,
              height: 28 / 20,
              color: AppColors.black,
            ),
            SpacersVertical.spacer32,
            FilterByRow(
              index: 0,
              filter: state.filterList[0]['title'],
              isSelected: state.filterList[0]['isSelected'],
            ),
            Divider(
              height: 20,
              thickness: 0.7,
            ),
            SpacersVertical.spacer6,
            FilterByRow(
              index: 1,
              filter: state.filterList[1]['title'],
              isSelected: state.filterList[1]['isSelected'],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterByRow extends StatelessWidget {
  const FilterByRow({
    super.key,
    required this.filter,
    required this.isSelected,
    required this.index,
  });
  final String filter;
  final bool isSelected;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SearchBloc>().add(SelectFilter(selectedIndex: index));
        context.pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.poppinsMedium(
            filter,
            fontSize: 16,
            height: 24 / 16,
            color: AppColors.black,
          ),
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.orangePrimary,
                width: 2.w,
              ),
            ),
            child: isSelected
                ? Container(
                    margin: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: AppColors.orangePrimary,
                      shape: BoxShape.circle,
                    ),
                  )
                : null,
          )
        ],
      ),
    );
  }
}
