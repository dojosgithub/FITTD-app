import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../widgets/female_preview.dart';
import '../widgets/male_preview.dart';

class SizePreviewView extends StatelessWidget {
  const SizePreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_ios)),
        title: AppText.poppinsMedium(
          "Size Recommendation",
          fontSize: 16,
          height: 24 / 16,
          color: AppColors.black,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final height = constraints.maxHeight;
                final width = constraints.maxWidth;

                return BlocBuilder<MeasurementBloc, MeasurementState>(
                  builder: (context, state) => state.style == "male"
                      ? MaleSizePreview(
                          width: width,
                          height: height,
                          model: state.maleMeasurementModel,
                        )
                      : FemaleSizePreview(
                          width: width,
                          height: height,
                          model: state.femaleMeasurementModel,
                        ),
                );
              },
            ),
          ),
          CustomButton(
            text: "Confirm",
            onTap: () {
              context.read<MeasurementBloc>().add(OnboardUser());
            },
          ),
          SpacersVertical.spacer40,
        ],
      ),
    );
  }
}
