import 'package:fitted/config/router/enum/app_routes_enum.dart';

import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/data/models/measurement_model.dart';
import 'package:fitted/features/measurement/presentation/widgets/build_measurement_feild.dart';
import 'package:fitted/features/measurement/presentation/widgets/female/female_feilds.dart';
import 'package:flutter/material.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/enums/female_measurement_enum.dart';
import '../../../../data/models/female_measurement_model.dart';

class FemaleLowerForm extends StatelessWidget {
  FemaleLowerForm({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurementBloc, MeasurementState>(
      builder: (context, state) => Form(
        key: _formKey,
        child: Column(
          children: [
            for (final field in femaleLowerFields) ...[
              MeasurementField(
                label: field['label'] as String,
                fieldEnum: field['enum'] as FemaleMeasurementEnum,
                getter: (model) => (field['getter'] as Measurement Function(
                    FemaleMeasurementModel))(model as FemaleMeasurementModel),
                state: state,
                parentContext: context,
              ),
              SpacersVertical.spacer18,
            ],
            CustomButton(
              text: "Next",
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.pushNamed(AppRoutesEnum.sizePreview.name);
                }
              },
            ),
            SpacersVertical.spacer28,
          ],
        ),
      ),
    );
  }
}
