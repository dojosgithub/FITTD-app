import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/widgets/app_text.dart';

class MeasurementAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const MeasurementAppbarWidget({
    super.key,
    required this.appbarTitle,
  });

  final String appbarTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
          onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_ios)),
      title: AppText.poppinsMedium(
        appbarTitle,
        fontSize: 16,
        height: 24 / 16,
        color: AppColors.black,
      ),
      centerTitle: false,
    );
  }
}
