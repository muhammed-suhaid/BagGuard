import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/enums/app_button_variant.dart';
import 'package:bagguard/shared/widgets/buttons/app_button.dart';
import 'package:bagguard/features/scan/data/models/scan_device.dart';
import 'package:bagguard/shared/widgets/app_bottom_action_layout.dart';
import 'package:bagguard/features/scan/presentation/bloc/scan_bloc.dart';
import 'package:bagguard/features/scan/presentation/bloc/scan_event.dart';
import 'package:bagguard/features/scan/presentation/widgets/discovered_device_card.dart';

class ScanResultView extends StatelessWidget {
  const ScanResultView({super.key, required this.devices});

  final List<ScanDevice> devices;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AppBottomActionLayout(
        centerContent: true,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${devices.length} ${AppStrings.devicesFound}',
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium,
            ),

            const SizedBox(height: AppSpacing.md),

            Text(
              AppStrings.keepYourDevicesClose,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),

            const SizedBox(height: AppSpacing.xxxl),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: devices.length,
              separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                final device = devices[index];

                return DiscoveredDeviceCard(
                  name: device.name,
                  rssi: device.rssi,
                  onConnect: () {
                    context.read<ScanBloc>().add(
                      ScanDeviceConnectionRequested(device: device),
                    );
                  },
                );
              },
            ),
          ],
        ),
        bottom: AppButton(
          text: AppStrings.scanAgain,
          variant: AppButtonVariant.outlined,
          onPressed: () {
            context.read<ScanBloc>().add(const ScanAgainRequested());
          },
        ),
      ),
    );
  }
}
