import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum ModalType { success, error, info }

enum ModalSize { small, large }

class ModalsAuthBase extends StatelessWidget {
  final ModalType modalType;
  final Widget child;
  final String title;
  final ModalSize size;
  final String? buttonLabel;
  final VoidCallback? onButtonPressed;

  const ModalsAuthBase({
    required this.modalType,
    required this.child,
    required this.title,
    required this.size,
    this.buttonLabel,
    this.onButtonPressed,
    super.key,
  });

  static Future<void> showSmall({
    required BuildContext context,
    required ModalType type,
    required String title,
    required Widget child,
  }) {
    return showDialog(
      context: context,
      builder:
          (context) => ModalsAuthBase(
            modalType: type,
            size: ModalSize.small,
            title: title,
            child: child,
          ),
    );
  }

  /// Exibe um modal GRANDE, com um botão de ação customizável.
  static Future<void> showLarge({
    required BuildContext context,
    required ModalType type,
    required String title,
    required Widget child,
    required String buttonLabel,
    required VoidCallback? onButtonPressed,
  }) {
    return showDialog(
      context: context,
      builder:
          (context) => ModalsAuthBase(
            modalType: type,
            size: ModalSize.large,
            title: title,
            buttonLabel: buttonLabel,
            onButtonPressed: onButtonPressed,
            child: child,
          ),
    );
  }

  _primaryColor(context) {
    switch (modalType) {
      case ModalType.success:
        return Theme.of(context).colorScheme.secondary;
      case ModalType.error:
        return Theme.of(context).colorScheme.error;
      case ModalType.info:
        return Theme.of(context).colorScheme.primary;
    }
  }

  _onPrimaryColor(context) {
    switch (modalType) {
      case ModalType.success:
        return Theme.of(context).colorScheme.onSecondary;
      case ModalType.error:
        return Theme.of(context).colorScheme.onError;
      case ModalType.info:
        return Theme.of(context).colorScheme.onPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      insetPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(maxWidth: size==ModalSize.small?440:597),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: _primaryColor(context),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _onPrimaryColor(context),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.close),
                    color: _onPrimaryColor(context),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(16.0), child: child),

          if (size == ModalSize.large) ...[
            Divider(),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 8,
              ),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: onButtonPressed,
                  style: FilledButton.styleFrom(
                    backgroundColor: _primaryColor(context),
                    foregroundColor: _onPrimaryColor(context),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    buttonLabel!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: _onPrimaryColor(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
