
import 'package:fitted/config/helper/spacers/spacers.dart';
import 'package:fitted/features/measurement/data/enums/female_measurement_enum.dart';
import 'package:fitted/features/measurement/data/models/measurement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/widgets/input_feild.dart';
import '../bloc/bloc.dart';
import 'unit_dropdown.dart';

class MeasurementField extends StatefulWidget {
  final String label;
  final Object fieldEnum;
  final MeasurementState state;
  final BuildContext parentContext;
  final Measurement Function(Object model) getter;

  const MeasurementField({
    required this.label,
    required this.fieldEnum,
    required this.state,
    required this.getter,
    required this.parentContext,
    super.key,
  });

  @override
  State<MeasurementField> createState() => _MeasurementFieldState();
}

class _MeasurementFieldState extends State<MeasurementField> {
  late final TextEditingController _controller;

  late Measurement currentMeasurement;

  @override
  void initState() {
    super.initState();
    currentMeasurement = widget.getter(_extractModelFromState());
    _controller = TextEditingController(
      text: _formatMeasurementText(currentMeasurement),
    );
  }

  Object _extractModelFromState() {
    final style = widget.state.style;
    if (style == "female") return widget.state.femaleMeasurementModel;
    if (style == "male") return widget.state.maleMeasurementModel;
    return widget.state.otherMeasurementModel;
  }

  String _formatMeasurementText(Measurement m) {
    final isCupSize = widget.fieldEnum is FemaleMeasurementEnum &&
        widget.fieldEnum == FemaleMeasurementEnum.cupSize;
    return isCupSize ? (m.description ?? "") : "${m.value}";
  }

  @override
  void didUpdateWidget(covariant MeasurementField oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newMeasurement = widget.getter(_extractModelFromState());
    final newText = _formatMeasurementText(newMeasurement);

    if (_controller.text != newText) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _controller.text = newText;
        }
      });
    }

    currentMeasurement = newMeasurement;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = widget.getter(_extractModelFromState());

    return FittedInputField.withIcon(
      validator: (value) {
        if (value == null || value.trim().isEmpty) return "Required";

        final isCupSize = widget.fieldEnum is FemaleMeasurementEnum &&
            widget.fieldEnum == FemaleMeasurementEnum.cupSize;

        if (!isCupSize) {
          final numValue = num.tryParse(value);
          if (numValue == null || numValue == 0) {
            return "Must be a valid number";
          }
        }

        return null;
      },
      spacing: SpacersVertical.spacer8,
      label: widget.label,
      hint: "eg. 150",
      controller: _controller,
      keyboardType: TextInputType.number,
      onChanged: (p0) {
        if (p0.isNotEmpty) {
          final isCupSize = widget.fieldEnum is FemaleMeasurementEnum &&
              widget.fieldEnum == FemaleMeasurementEnum.cupSize;

          widget.parentContext.read<MeasurementBloc>().add(
                UpdateMeasurement(
                  field: widget.fieldEnum,
                  value: isCupSize
                      ? Measurement(
                          value: m.value, unit: m.unit, description: p0)
                      : Measurement(value: num.parse(p0), unit: m.unit),
                ),
              );
        }
      },
      suffixIcon: UnitDropdown(
        selectedUnit: m.unit,
        field: widget.fieldEnum,
        value: m.value,
      ),
    );
  }
}
