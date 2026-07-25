import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/core/constants/app_icons.dart';
import 'package:bagguard/shared/widgets/app_header.dart';
import 'package:bagguard/core/constants/app_strings.dart';
import 'package:bagguard/core/constants/app_dimensions.dart';
import 'package:bagguard/shared/widgets/app_device_card.dart';
import 'package:bagguard/shared/widgets/buttons/app_icon_button.dart';

class DevicesView extends StatelessWidget {
  const DevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    const devices = [
      _MockDevice(name: 'Laptop Bag', batteryLevel: 92, isConnected: true),
      _MockDevice(name: 'Travel Bag', batteryLevel: 71, isConnected: false),
      _MockDevice(name: 'Backpack', batteryLevel: 50, isConnected: false),
      _MockDevice(name: 'Camera Bag', batteryLevel: 86, isConnected: true),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.sm),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeader(
              leading: Padding(
                padding: const EdgeInsets.only(left: AppSpacing.sm),
                child: Text(
                  AppStrings.myDevices,
                  style: textTheme.headlineLarge,
                ),
              ),
              trailing: AppIconButton(
                icon: const Icon(AppIcons.add),
                iconSize: AppDimensions.iconLarge,
                onPressed: () {},
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: devices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.lg,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final device = devices[index];

                  return AppDeviceCard(
                    name: device.name,
                    image: const FlutterLogo(size: 70),
                    batteryLevel: device.batteryLevel,
                    isConnected: device.isConnected,
                    onTap: () {},
                    onMorePressed: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MockDevice {
  const _MockDevice({
    required this.name,
    required this.batteryLevel,
    required this.isConnected,
  });

  final String name;
  final int batteryLevel;
  final bool isConnected;
}
