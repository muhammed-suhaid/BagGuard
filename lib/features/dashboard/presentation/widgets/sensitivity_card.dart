import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/shared/widgets/app_card.dart';
import 'package:bagguard/shared/widgets/app_slider.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/utils/sensitivity_utils.dart';
import 'package:bagguard/shared/widgets/app_section_header.dart';
import 'package:bagguard/features/devices/data/models/device.dart';
import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:bagguard/features/dashboard/presentation/bloc/dashboard_event.dart';

class SensitivityCard extends StatefulWidget {
  const SensitivityCard({
    super.key,
    required this.device,
    required this.enabled,
  });

  final Device device;
  final bool enabled;

  @override
  State<SensitivityCard> createState() => _SensitivityCardState();
}

class _SensitivityCardState extends State<SensitivityCard> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.device.sensitivity.toDouble();
  }

  @override
  void didUpdateWidget(covariant SensitivityCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.device.id != widget.device.id) {
      _value = widget.device.sensitivity.toDouble();
      return;
    }

    if (oldWidget.device.sensitivity != widget.device.sensitivity &&
        _value.round() != widget.device.sensitivity) {
      _value = widget.device.sensitivity.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppCard(
      child: Column(
        children: [
          AppSectionHeader(
            title: AppStrings.sensitivity,
            action: Text(SensitivityUtils.label(_value.round())),
          ),

          const SizedBox(height: AppSpacing.md),

          AppSlider(
            value: _value,
            label: _value.round().toString(),
            onChanged: widget.enabled
                ? (value) {
                    setState(() {
                      _value = value;
                    });
                  }
                : null,
            onChangeEnd: widget.enabled
                ? (value) {
                    context.read<DashboardBloc>().add(
                      SensitivityChanged(value: value.round()),
                    );
                  }
                : null,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.low, style: textTheme.bodyMedium),
              Text(AppStrings.high, style: textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
