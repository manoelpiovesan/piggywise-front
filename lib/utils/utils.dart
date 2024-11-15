import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:piggywise_child_front/utils/config.dart';

///
///
///
class Utils {
  ///
  ///
  ///
  CupertinoNavigationBar navBar({
    final String? title,
    final Widget? trailing,
    final String? previousTitle,
  }) =>
      CupertinoNavigationBar(
        previousPageTitle: previousTitle,
        trailing: trailing,
        middle: title != null
            ? Text(title)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /// Title
                      Text(Config().appName),

                      /// Subtitle
                      Text(
                        Config().slogan,
                        style: const TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      );

  ///
  ///
  ///
  static Future<void> navReplace(
    final BuildContext context,
    final Widget page,
  ) async {
    await Navigator.of(context).pushReplacement(
      CupertinoPageRoute<void>(
        builder: (final BuildContext context) => page,
      ),
    );
  }

  ///
  ///
  ///
  static Future<void> nav(
    final BuildContext context,
    final Widget page,
  ) async {
    await Navigator.of(context).push(
      CupertinoPageRoute<void>(
        builder: (final BuildContext context) => page,
      ),
    );
  }

  ///
  ///
  ///
  static SizedBox get spacer => const SizedBox(height: 16, width: 8);

  ///
  ///
  ///
  void alert(final BuildContext context, final String message) {
    showCupertinoDialog<void>(
      context: context,
      builder: (final BuildContext context) => CupertinoAlertDialog(
        title: const Text('Atenção'),
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  ///
  ///
  ///
  static String formatDate(final DateTime? date) {
    if (date == null) {
      return '';
    }
    return DateFormat('dd/MM HH:mm').format(date);
  }

  ///
  ///
  ///
  static void get toggleTheme {
    Config.instance.brightness = Config.instance.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;
  }
}
