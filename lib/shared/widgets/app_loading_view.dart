import 'package:flutter/material.dart';

import 'package:bagguard/shared/widgets/app_loading.dart';
import 'package:bagguard/shared/widgets/app_state_content.dart';

class AppLoadingView extends StatelessWidget {
  const AppLoadingView({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppStateContent(
        illustration: AppLoading(),
        title: title,
        message: message,
      ),
    );
  }
}
