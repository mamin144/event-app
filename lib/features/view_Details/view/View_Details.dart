import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../../../core/color/AppColors.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/models/fireBase_model/add_event_model.dart';
import '../../../core/utils/FireStore/firestore_utils.dart';
import '../../../core/widgets/CustomElevatedButton.dart';
import '../../../core/widgets/textFormField.dart';

class ViewDetails extends StatefulWidget {
  final String eventId;


  const ViewDetails({super.key, required this.eventId});

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  bool isEditing = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event details'),

        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Bounceable(
                  onTap: () {
                    setState(() {
                      isEditing = true;
                    });
                  },
                  child: Assets.icons.editIcn.svg(height: 50, width: 50),
                ),
                Bounceable(
                  onTap: () {
                    FirestoreUtils.deleteEvent(widget.eventId);
                    Navigator.pop(context);
                  },
                  child: Assets.icons.delete.svg(height: 32, width: 32),
                ),
              ],
            ),
          ),
        ],

      ),
      body: FutureBuilder<DocumentSnapshot<AddEventModel>>(
        future: FirestoreUtils.viewInDetails(widget.eventId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('Event not found'));
          }

          final event = snapshot.data!.data()!;

          final titleController = TextEditingController(
            text: event.eventTittle,
          );
          final descController = TextEditingController(text: event.eventDesc);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
              height: 195,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Appcolors.stroke),
                image: DecorationImage(
                  image: AssetImage(event.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Title',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Appcolors.mainText,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: 'Tittle...',
              controller: titleController,
              enabled: isEditing,
            ),
            const SizedBox(height: 16),
            Text(
              'Description',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Appcolors.mainText,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: 'Description Tittle...',
              controller: descController,
              enabled: isEditing,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Assets.icons.calendarAdd.svg(),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Event Date',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Appcolors.mainText,
                    ),
                  ),
                ),
                Text(
                  DateFormat('yyyy-MM-dd').format(event.selectedEventDate),

                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Appcolors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            isEditing ? Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: CustomElevatedButton(
                onPressed: () {
                  FirestoreUtils.updateEvent(widget.eventId,

                      {
                        'eventTittle': titleController.text,
                        'eventDesc': descController.text,
                        'selectedEventDate': event.selectedEventDate
                            .millisecondsSinceEpoch,

                      }


                  );

                  Navigator.pop(context);
                },
                text: 'Save',
              ),
            ) : const SizedBox.shrink(),
            // Spacer(),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            //   child: CustomElevatedButton(
            //     onPressed: ()  {
            //
            //
            //
            //
            //       },
            //
            //     text: 'save',
            //   ),
            // ),
            ],
          ),);
        },
      ),
    );
  }
}
