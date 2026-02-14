import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../core/color/AppColors.dart';
import '../../../core/gen/assets.gen.dart';

class EventCard extends StatelessWidget {
  final String date;
  final String title;
  final String description;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;


  const EventCard({
    super.key,
    required this.date,
    required this.title,
    required this.imagePath,
    required this.description,
   required this.isFavorite ,
    required this.onTap,
    this.onFavoriteTap,

  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Bounceable(
          onTap: onTap,
          child: Container(
            height: 195,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(16),
                border:Border.all(color: Appcolors.stroke),
            image: DecorationImage(
                image: AssetImage(imagePath),
              fit: BoxFit.cover
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                    decoration: BoxDecoration(
                      color: Appcolors.scaffoldBackGround,

                      borderRadius: BorderRadius.circular(8),
                      border:Border.all(color: Appcolors.stroke)

                    ),

                    // width: double.infinity,
                    child: Text(
                      date,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Appcolors.primary,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                  decoration: BoxDecoration(
                      color: Appcolors.scaffoldBackGround,
                      borderRadius: BorderRadius.circular(8),
                      border:Border.all(color: Appcolors.stroke)

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        description,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Appcolors.mainText,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      GestureDetector(
                          onTap: onFavoriteTap,
                          child: isFavorite ?Assets.icons.activeFavorite.svg()
                              :Assets.icons.inActiveFavorite.svg())
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
