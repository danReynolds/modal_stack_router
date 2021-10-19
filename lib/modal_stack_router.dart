library modal_stack_router;

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:stack_router/stack_router.dart';

export 'package:stack_router/stack_router.dart';

Future<T?> showModalStackRouter<T>({
  /// The [BuildContext] provided to the modal bottom sheet.
  required BuildContext context,

  /// The child widget that typically is an instance of or builds a [StackRouter].
  required Widget child,

  /// The alignment of the modal.
  Alignment alignment = Alignment.topCenter,

  /// The background color of the are beneath the modal being shown.
  Color barrierColor = Colors.black54,

  /// The margin of the modal.
  EdgeInsets margin = const EdgeInsets.only(top: 200),

  /// The border radius of the modal.
  BorderRadiusGeometry? borderRadius,
}) {
  return showCustomModalBottomSheet<T>(
    barrierColor: barrierColor,
    context: context,
    builder: (context) => child,
    duration: Duration.zero,
    enableDrag: false,
    containerWidget: (_, animation, child) {
      return Container(
        alignment: Alignment.topCenter,
        margin: margin,
        child: Material(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          child: child,
        ),
      );
    },
  );
}
