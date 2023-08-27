import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/services/theme_changing.dart';

class DarkOrLightBtn extends StatefulWidget {
  const DarkOrLightBtn({super.key});

  @override
  State<DarkOrLightBtn> createState() => _DarkOrLightBtnState();
}

class _DarkOrLightBtnState extends State<DarkOrLightBtn> {
  bool isDarkOrLight = false;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.dark_mode);
      }
      return const Icon(Icons.light_mode);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.white38,
      value: context.watch<ThemeNotifier>().isDark,
      thumbIcon: thumbIcon,
      onChanged: (bool value) {
        context.read<ThemeNotifier>().toggleTheme(); // Toggle the theme
      },
    );
  }
}
