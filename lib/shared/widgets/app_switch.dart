import 'package:flutter/material.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.enabled = true,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool enabled;

  bool get _isEnabled => enabled && onChanged != null;

  @override
  Widget build(BuildContext context) {
    return Switch(value: value, onChanged: _isEnabled ? onChanged : null);
  }
}
