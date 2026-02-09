import 'package:event/core/color/AppColors.dart';
import 'package:event/core/gen/assets.gen.dart';
import 'package:event/core/models/category_model/category_model.dart';
import 'package:event/core/models/fireBase_model/add_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/FireStore/firestore_utils.dart';
import '../../../core/widgets/CustomElevatedButton.dart';
import '../../../core/widgets/textFormField.dart';
import '../../Home/widgets/tabItem.dart';

class AddEventView extends StatefulWidget {
  const AddEventView({super.key});

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  String path = Assets.images.birthday.path;
  final bool isSelected = false;
  late String hintText = 'Tittle...';
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
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
  int _currentIndex = 0;
  DateTime? selectedDate;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // final TextEditingController titleController = TextEditingController();
    // final TextEditingController descriptionController = TextEditingController();
    //
    // String path = Assets.images.birthday.path; // default
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 16,
            children: [
              Container(
                height: 195,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Appcolors.stroke),
                  image: DecorationImage(
                    image: AssetImage(path),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              DefaultTabController(
                initialIndex: 0,
                animationDuration: const Duration(milliseconds: 100),
                length: categories.length,
                child: TabBar(
                  // onTap: (index) {
                  //   setState(() {
                  //     titleController.text = categories[index].name;
                  //   path = categories[index].iconPath.toString();
                  //   });
                  //
                  // },
                  onTap: (index) {
                    setState(() {
                      hintText = categories[index].name;
                      path = categories[index].imagePath;
                      _currentIndex = index;
                    });
                  },
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
                ),
              ),
              // SizedBox.shrink(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tittle',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Appcolors.mainText,
                        decoration: TextDecoration.none,
                        decorationColor: Appcolors.mainText,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: hintText,
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter Tittle';
                        }
                        return null;
                      },

                      // maxLines: 4,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Description',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Appcolors.mainText,
                        decoration: TextDecoration.none,
                        decorationColor: Appcolors.mainText,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextFormField(
                      hintText: 'Description Tittle...',
                      controller: descriptionController,
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Assets.icons.calendarAdd.svg(),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Event Date',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Appcolors.mainText,
                            ),
                          ),
                        ),
                        Bounceable(
                          onTap: () {
                            getSelectedDate();
                          },
                          child: Text(
                            selectedDate != null
                                ? DateFormat().format(selectedDate!)
                                : 'Choose Date',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Appcolors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: CustomElevatedButton(
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            if (selectedDate == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please Select Date')),
                              );
                            }
                            final event = AddEventModel(
                              eventTittle: titleController.text,
                              eventDesc: descriptionController.text,
                              selectedEventDate: selectedDate!,
                              categoryId: categories[_currentIndex].id,
                              imagePath: categories[_currentIndex].imagePath,
                            );
                            await FirestoreUtils.addEvent(event);
                            Navigator.pop(context);
                          }
                        },
                        text: 'Add Event',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getSelectedDate() async {
    var currentDateTime = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    setState(() {
      selectedDate = currentDateTime;
    });
  }
}
