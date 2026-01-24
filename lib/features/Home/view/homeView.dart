import 'package:event/features/Home/widgets/tabItem.dart';
import 'package:flutter/material.dart';

import '../../../core/color/AppColors.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/models/category_model/category_model.dart';
import '../widgets/eventCard.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<CategoryModel> categories = [
      CategoryModel(
          id: 'bookClub',
          name: 'Book Club',
          iconPath: Assets.icons.book.svg(
            colorFilter: ColorFilter.mode(Appcolors.input, BlendMode.srcIn),
          ),
          imagePath: Assets.images.cfbdd1ca3a3007acd532d6e292e2476f1bc5c86d.path
      ),
      CategoryModel(
          id: 'sports',
          name: 'Sports',
          iconPath: Assets.icons.bycle.svg(
            colorFilter: ColorFilter.mode(Appcolors.input, BlendMode.srcIn),
          ),
          imagePath: Assets.images.sport.path
      ),
      CategoryModel(
          id: 'birthday',
          name: 'Birthday',
          iconPath: Assets.icons.birthdayCake.svg(
            colorFilter: ColorFilter.mode(Appcolors.input, BlendMode.srcIn),
          ),
          imagePath: Assets.images.birthday.path

      ),
      // CategoryModel(
      //   id: 'meeting',
      //   name: 'Meeting',
      //   iconPath: SvgPicture(Icon(Icons.meeting_room) as BytesLoader),
      // ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTabController(
              initialIndex: 0,
              animationDuration: const Duration(milliseconds: 100),
              length: categories.length,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                indicator: BoxDecoration(),
                labelPadding: EdgeInsets.all(8),
                tabs: categories
                    .map((e) => TabItem(text: e.name, icon: e.iconPath))
                    .toList(),
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