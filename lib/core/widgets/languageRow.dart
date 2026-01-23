// import 'package:event/core/color/AppColors.dart';
// import 'package:event/core/providers/Theme_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../gen/assets.gen.dart';
// import '../providers/app_langue_provider.dart';
//
// class LanguageRow extends StatelessWidget {
//   const LanguageRow({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final appLanguageProvider = Provider.of<AppLanguageProvider>(context);
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     return Row(
//       spacing: 5,
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Align(
//             alignment: Alignment.center,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//                 border: Border.all(color: Appcolors.primary, width: 2),
//               ),
//           child: Row(
//             spacing: 5,
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     // appLanguageProvider.currentLanguage = 'en';
//                     appLanguageProvider.changeLanguage('en');
//                   },
//                   child: Assets.icons.lr1.svg(width: 25, height: 25),
//                 ),
//               ),
//               const SizedBox(width: 25),
//
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     appLanguageProvider.changeLanguage('ar');
//                   },
//                   child: Assets.icons.eg1.svg(width: 25, height: 25),
//                 ),
//               ),
//
//
//             ],
//           ),
//
//             ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: CircleAvatar(
//             maxRadius: 20,
//             backgroundColor: Appcolors.primary,
//             child: IconButton(
//               onPressed: () {
//                 if (themeProvider.themeData == ThemeMode.light) {
//                   themeProvider.ChangeTheme(ThemeMode.dark);
//                 } else {
//                   themeProvider.ChangeTheme(ThemeMode.light);
//                 }
//               },
//               icon: Icon(
//                 themeProvider.themeData == ThemeMode.dark
//                     ? Icons.sunny
//                     : Icons.nightlight_round,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
