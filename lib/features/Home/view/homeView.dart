import 'package:event/features/Home/widgets/tabItem.dart';
import 'package:flutter/material.dart';

import '../../../core/color/AppColors.dart';
import '../../../core/gen/assets.gen.dart';
import '../widgets/eventCard.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTabController(
              initialIndex: 0,
              animationDuration: const Duration(milliseconds: 100),
              length: 4,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                indicator: BoxDecoration(),
                labelPadding: EdgeInsets.all(8),
                tabs: List.generate(
                  4,
                      (index) => TabItem(
                    text: 'sports',
                    icon: Assets.icons.bycle.svg(
                      colorFilter: ColorFilter.mode(
                        Appcolors.input,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16,),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                // padding: EdgeInsets.all(16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return EventCard(
                    date: '21 Jan',
                    title: 'This is a Birthday Party',
                    imagePath: Assets.images.forgetPassword.path,
                    isFavorite: false,
                    onFavoriteTap: () {
                      // Handle favorite tap
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}