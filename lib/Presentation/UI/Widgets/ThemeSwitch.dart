import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:sbsr/Core/Providers/ThemeProvider.dart';
import 'package:sbsr/Core/Theme/Theme.dart';

class ThemeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return AnimatedToggleSwitch.rolling(
      current: theme.getTheme(),
      values: const [ThemeMode.dark, ThemeMode.light],
      height: 40,
      colorBuilder: (value) => Theme.of(context).primaryColor,
      iconBuilder: (value, size, foreground) {
        if (value == ThemeMode.dark) {
          return const Icon(EvaIcons.moon , color: MyTheme.offWhite,);
        } else {
          return const Icon(EvaIcons.sun , color: MyTheme.offWhite,);
        }
      },
      onChanged: (p0) => theme.changeTheme(theme.isPurple()? ThemeMode.light : ThemeMode.dark),
      transitionType: ForegroundIndicatorTransitionType.fading,
      borderRadius: BorderRadius.circular(12),
      borderColor: Theme.of(context).primaryColor,
      borderWidth: 1,
      dif: 10,
    );
  }
}
