import 'package:fitted/config/router/enum/app_routes_enum.dart';

import 'package:fitted/features/measurement/presentation/bloc/bloc.dart';
import 'package:fitted/features/measurement/data/models/male_measurement_model.dart';
import 'package:fitted/features/measurement/data/models/measurement_model.dart';
import 'package:fitted/features/measurement/presentation/widgets/build_measurement_feild.dart';
import 'package:flutter/material.dart';
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/config/widgets/buttons/primary/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../data/enums/male_measurement_enum.dart';
import '../male_feilds.dart';

class MaleLowerForm extends StatelessWidget {
  MaleLowerForm({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurementBloc, MeasurementState>(
      builder: (context, state) => Form(
        key: _formKey,
        child: Column(
          children: [
            for (final field in maleLowerFields) ...[
              MeasurementField(
                label: field['label'] as String,
                fieldEnum: field['enum'] as MaleMeasurementEnum,
                getter: (model) => (field['getter'] as Measurement Function(
                    MaleMeasurementModel))(model as MaleMeasurementModel),
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
