import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/products/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductUrlDialog extends StatelessWidget {
  const ProductUrlDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      height: 378.h,
      width: 336.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 3),
          AppText.poppinsBold(
            "You are leaving our app",
            fontSize: 20,
            height: 28 / 20,
            color: AppColors.black,
            textAlign: TextAlign.center,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyles.poppinsRegular(
                fontSize: 14,
                height: 22 / 14,
                color: const Color(0xFF14060B).withValues(alpha: 0.6),
              ),
              children: [
                const TextSpan(
                  text:
                      "The button you clicked is attempting to open an external link ",
                ),
                TextSpan(
                  text: context
                      .read<ProductsBloc>()
                      .state
                      .productDetailEntity!
                      .product
                      .url,
                  style: AppTextStyles.poppinsRegular(
                    fontSize: 14,
                    height: 22 / 14,
                    color: AppColors.orangePrimary,
                  ),
                ),
                const TextSpan(
                  text: " would you like to continue?",
                ),
              ],
            ),
          ),
          Spacer(),
          CustomButton(
            text: 'Continue',
            height: 52.h,
            width: 284.w,
            onTap: () async {
              context.read<ProductsBloc>().add(
                    AddClick(
                      productId: context
                          .read<ProductsBloc>()
                          .state
                          .productDetailEntity!
                          .product
                          .id,
                    ),
                  );
              await launchUrl(
                Uri.parse(
                  context
                      .read<ProductsBloc>()
                      .state
                      .productDetailEntity!
                      .product
                      .url,
                ),
              ).then((v) => context.pop());
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
