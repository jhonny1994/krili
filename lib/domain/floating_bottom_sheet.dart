import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FloatingModal extends StatelessWidget {
  const FloatingModal({
    required this.child,
    super.key,
    this.backgroundColor,
  });

  final Color? backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}

Future<void> showFloatingModalBottomSheet({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
}) async {
  final result = await showCustomModalBottomSheet<void>(
    context: context,
    builder: builder,
    containerWidget: (_, animation, child) => FloatingModal(
      child: child,
    ),
  );

  return result;
}
