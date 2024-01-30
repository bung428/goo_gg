import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/widget/dialog/app_bottom_sheet.dart';

typedef DialogWidgetBuilder = Widget Function(BuildContext context);

Widget Function(BuildContext context,
    List<(dynamic result, String text, ButtonStyle? style)> actions)
buildActions = (BuildContext context,
List<(dynamic result, String text, ButtonStyle? style)> actions) {
  final actionWidget = <Widget>[];
  for (final (result, text, style) in actions) {
    if (actionWidget.isNotEmpty) {
      actionWidget.add(const SizedBox(
      width: 8,
      ));
    }
    actionWidget.add(Expanded(
      child: ElevatedButton(
      style: style,
      onPressed: () {
        Navigator.of(context).pop(result);
    },
    child: Container(
      width: double.infinity,
      height: 48,
      alignment: AlignmentDirectional.center,
      child: Text(text),
      ))));
  }

  return Row(
    children: actionWidget,
  );
};

Future<void> showLoadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (BuildContext buildContext) {
      final theme = Theme.of(context);
      return PopScope(
        canPop: false,
        onPopInvoked: (_) {},
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: theme.disabledColor,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  );
}

void hideLoadingDialog(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.pop(context);
  }
}

Future<dynamic> appSimpleDialog({
  required BuildContext context,
  bool isDismissible = true,
  bool isScrollControlled = false,
  DialogWidgetBuilder? title,
  DialogWidgetBuilder? content,
  DialogWidgetBuilder? action,
  List<(dynamic, String, ButtonStyle?)>? actions,
}) {
  return showAlertDialog(
      context: context,
      isDismissible: isDismissible,
      title: title != null ? (_) => title(_) : null,
      content: content != null ? (_) => content(_) : null,
      action: actions != null ? (_) => buildActions(context, actions)
          : action != null ? (_) => action(_)
      : null,
  );
}

Future<dynamic> showAlertDialog({
  required BuildContext context,
  bool isDismissible = true,
  WidgetBuilder? title,
  WidgetBuilder? content,
  WidgetBuilder? action,
  List<(dynamic, String, ButtonStyle?)>? actions,
}) {
  return showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        final actionWidget = action?.call(context);
        final contentWidget = content?.call(context);

        return AlertDialog(
          title: title?.call(context),
          content: contentWidget != null ? SingleChildScrollView(child: contentWidget,) : null,
          actions: actionWidget != null ? [actionWidget] : null,
        );
      });
}

Future<void> appErrorDialog(
  BuildContext context,
  String? title,
  String? content
) {
  return showAppBottomSheet(
      context: context,
      title: (context) {
        return Container(
          padding: const EdgeInsetsApp(horizontal: 16),
          child: Row(
            children: [
              Icon(
                Icons.warning_amber,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(width: 8,),
              Expanded(
                child: Text(
                  title ?? '',
                ),
              )
            ],
          ),
        );
      },
      content: (context) {
        if (content == null) {
          return const SizedBox(height: 16,);
        }

        return Container(
          padding: const EdgeInsetsApp(horizontal: 16, vertical: 16),
          child: Text(content),
        );
      },
      actions: [(null, '확인', null)]);
}

Future<void> showExceptionBuilder(BuildContext context, Object e) async {
  return appErrorDialog(context, null, e.toString());
}