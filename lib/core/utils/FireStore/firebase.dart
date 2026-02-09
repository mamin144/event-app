import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/core/models/fireBase_model/add_event_model.dart';

class Firebase {
  CollectionReference<AddEventModel> getRef() {
    return FirebaseFirestore.instance
        .collection('event')
        .withConverter<AddEventModel>(
          fromFirestore: (snapshot, options) =>
              AddEventModel.fromFireStore(snapshot.data()!),
          toFirestore: (value, options) => value.toFireStore(),
        );
  }
  List<AddEventModel> events=[];

  Future<void> addEvent(AddEventModel event)async{
   final doc = getRef().doc();
   event.eventId = doc.id;
   await doc.set(event);
  }
}
