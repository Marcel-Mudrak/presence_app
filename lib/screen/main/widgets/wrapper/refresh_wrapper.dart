import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:utopia_hooks/utopia_hooks.dart';

class RefreshWrapper extends HookWidget {
  final Widget child;
  final Widget loadingItem;
  final Widget? staticItem;
  final bool isLoading;
  final Future<void> Function() onRefresh;
  final int loadingItemQuantity;
  final double itemSpacing;

  const RefreshWrapper({
    super.key,
    required this.isLoading,
    required this.onRefresh,
    required this.loadingItem,
    required this.child,
    this.staticItem,
    this.loadingItemQuantity = 12,
    this.itemSpacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.niceWhite,
      backgroundColor: Colors.transparent,
      onRefresh: () async {
        await onRefresh();
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      return _buildLoading();
    } else {
      return child;
    }
  }

  Widget _buildLoading() {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        if (staticItem != null) staticItem!,
        for (int i = 0; i < loadingItemQuantity; i++)
          Padding(
            padding: EdgeInsets.only(top: itemSpacing),
            child: loadingItem,
          ),
      ],
    );
  }
}
