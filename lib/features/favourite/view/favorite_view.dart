import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/models/category_model/category_model.dart';
import '../../../core/models/fireBase_model/add_event_model.dart';
import '../../../core/utils/FireStore/firestore_utils.dart';
import '../../Home/widgets/eventCard.dart';
import '../../Home/widgets/tabItem.dart';

class FavoriteView extends StatefulWidget {
   const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  List<CategoryModel> categories = [
    CategoryModel(
      id: 'bookClub',
      name: 'Book Club',
      iconPath: Icons.menu_book,
      imagePath: Assets.images.cfbdd1ca3a3007acd532d6e292e2476f1bc5c86d.path,
    ),
    CategoryModel(
      id: 'sports',
      name: 'Sports',
      iconPath: Icons.directions_bike,
      imagePath: Assets.images.sport.path,
    ),
    CategoryModel(
      id: 'birthday',
      name: 'Birthday',
      iconPath: Icons.cake,
      imagePath: Assets.images.birthday.path,
    ),
    CategoryModel(
      id: 'meeting',
      name: 'Meeting',
      iconPath: Icons.meeting_room,
      imagePath: Assets.images.meeting.path,
    ),
  ];

  int _currentIndex = 1;

  late bool _isFavorite;

  @override
  Widget build(BuildContext context) {
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
                    .map(
                      (category) => TabItem(
                    categoryModel: category,
                    isSelected:
                    _currentIndex == categories.indexOf(category),
                  ),
                )
                    .toList(),

                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            StreamBuilder(
              stream: FirestoreUtils.getFavoriteEventsStream(categories[_currentIndex].id),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError){
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No events found.'));
                }



                // Data is ready, return the ListView
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      AddEventModel event = snapshot.data!.docs[index].data();
                      String eventId = snapshot.data!.docs[index].id;

                      return EventCard(
                        date: DateFormat(
                          'dd MMM',
                        ).format(event.selectedEventDate),
                        title: event.eventTittle,
                        description: event.eventDesc,
                        imagePath: event.imagePath,
                        isFavorite: event.isFavorite,
                        onFavoriteTap: () {
                          print(event.imagePath);
                          FirestoreUtils.updateEvent(eventId, {'isFavorite': !event.isFavorite});
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
