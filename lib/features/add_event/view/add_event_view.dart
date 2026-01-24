import 'package:event/core/color/AppColors.dart';
import 'package:event/core/gen/assets.gen.dart';
import 'package:event/core/models/category_model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/widgets/textFormField.dart';
import '../../Home/widgets/tabItem.dart';

class AddEventView extends StatefulWidget {
   const AddEventView({super.key});

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  String path = Assets.images.birthday.path; // ✅ هنا صح

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
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
    // final TextEditingController titleController = TextEditingController();
    // final TextEditingController descriptionController = TextEditingController();
    //
    // final GlobalKey<FormState> key = GlobalKey<FormState>();
    // String path = Assets.images.birthday.path; // default
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: Text('Add Event')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
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
                      titleController.text = categories[index].name;
                     path = categories[index].imagePath;

                    });
                  },
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
              // SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                    hintText: 'Event Tittle',
                    controller: titleController,

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
                        onTap: () {},
                        child: Text(
                          'Choose Date',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
