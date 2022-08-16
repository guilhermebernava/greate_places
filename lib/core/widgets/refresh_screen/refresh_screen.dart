import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';

class RefreshScreen extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  const RefreshScreen({
    Key? key,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      backgroundColor: Colors.black,
      color: AppColors.primary,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
