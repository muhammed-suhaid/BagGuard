import 'package:flutter/material.dart';

import 'package:bagguard/core/theme/app_spacing.dart';
import 'package:bagguard/shared/widgets/app_device_card.dart';
import 'package:bagguard/features/devices/data/models/device.dart';
import 'package:bagguard/features/dashboard/presentation/widgets/add_device_card.dart';

class DeviceCarousel extends StatefulWidget {
  const DeviceCarousel({
    super.key,
    required this.devices,
    required this.onDeviceChanged,
  });

  final List<Device> devices;
  final ValueChanged<String> onDeviceChanged;

  @override
  State<DeviceCarousel> createState() => _DeviceCarouselState();
}

class _DeviceCarouselState extends State<DeviceCarousel> {
  late final PageController _pageController;

  double _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(viewportFraction: 0.5);

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            clipBehavior: Clip.none,
            itemCount: widget.devices.length + 1,
            onPageChanged: (index) {
              if (index < widget.devices.length) {
                widget.onDeviceChanged(widget.devices[index].id);
              }
            },
            itemBuilder: (context, index) {
              final distance = (_currentPage - index).abs();

              final scale = (1 - distance * 0.35).clamp(0.7, 1.0);

              final opacity = (_currentPage - index).abs() < 1
                  ? 1 - (_currentPage - index).abs() * 0.5
                  : 0.5;

              final child = index == widget.devices.length
                  ? const AddDeviceCard()
                  : AppDeviceCard(
                      name: widget.devices[index].name,
                      image: const FlutterLogo(size: 80),
                      isConnected: widget.devices[index].isConnected,
                      batteryLevel: widget.devices[index].batteryLevel,
                    );
              return Transform.scale(
                scale: scale,
                child: Opacity(opacity: opacity, child: child),
              );
            },
          ),
        ),

        const SizedBox(height: AppSpacing.sm),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.devices.length + 1, (index) {
            final selected = index == _currentPage.round();

            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeIn,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: selected ? 18 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey.shade300,
              ),
            );
          }),
        ),
      ],
    );
  }
}
