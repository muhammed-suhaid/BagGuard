import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({
    super.key,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.min = 0,
    this.max = 100,
    this.divisions,
    this.label,
  }) : assert(min < max, 'min must be less than max.'),
       assert(
         divisions == null || divisions > 0,
         'divisions must be greater than 0.',
       );

  final double value;
  final ValueChanged<double>? onChanged;
  final bool enabled;
  final double min;
  final double max;
  final int? divisions;
  final String? label;

  bool get _isEnabled => enabled && onChanged != null;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value.clamp(min, max),
      min: min,
      max: max,
      divisions: divisions,
      label: label,
      onChanged: _isEnabled ? onChanged : null,
    );
  }
}
