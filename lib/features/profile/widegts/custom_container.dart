import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

import '../../../core/color/AppColors.dart';
import '../../../core/providers/appSettingProvider.dart';

class CustomContainer extends StatefulWidget {
  final Icon? icon;
  final String text;
  VoidCallback? onTap;

  CustomContainer({super.key, this.icon, required this.text, this.onTap});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final appSettingProvider = Provider.of<AppSettingProvider>(context);

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Appcolors.white,
        borderRadius: BorderRadiusGeometry.circular(16),
        border: Border.all(color: Appcolors.stroke),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.text,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Appcolors.mainText,
              ),
            ),
          ),
          // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
          Directionality(
            textDirection: TextDirection.ltr,
            child:
                widget.icon ??
                Switcher(
                  value: false,
                  size: SwitcherSize.medium,
                  switcherButtonRadius: 50,
                  enabledSwitcherButtonRotate: true,
                  onTap: () {
                    if (appSettingProvider.currentTheme == ThemeMode.dark) {
                      appSettingProvider.ChangeTheme(ThemeMode.light);
                    } else {
                      appSettingProvider.ChangeTheme(ThemeMode.dark);
                    }
                  },

                  colorOff: Appcolors.disable,
                  colorOn: Appcolors.disable,
                  onChanged: (bool state) {
                    //
                  },
                ),
          ),
        ],
      ),
    );
  }
}
