import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/core/models/fireBase_model/add_event_model.dart';
import 'package:event/features/Home/widgets/eventCard.dart';

class FirestoreUtils {
  static CollectionReference<AddEventModel> getEventCollection() {
    return FirebaseFirestore.instance
        .collection('EventCollection')
        .withConverter<AddEventModel>(
          fromFirestore: (snapshot, _) =>
              AddEventModel.fromFireStore(snapshot.data()!),
          toFirestore: (event, _) => event.toFireStore(),
        );
  }

  static Future<void> addEvent(AddEventModel event) async {
    final doc = getEventCollection().doc();
    event.eventId = doc.id;
    await doc.set(event);
  }
  static Future<AddEventModel?> getEvent() async {
    final doc = getEventCollection().doc();
    final event = await doc.get();
    return event.data();
  }
   static Stream<QuerySnapshot<AddEventModel>> getStreamFromFirestore(String catecoryId) {
    var collectionRef = getEventCollection().where( 'categoryId', isEqualTo: catecoryId);
    return collectionRef.snapshots();

   }

   static Future<void> updateEvent(String eventId, Map<String, dynamic> data) async {
    final doc = getEventCollection().doc(eventId);
    await doc.update(data);

   }

  static Stream<QuerySnapshot<AddEventModel>> getFavoriteEventsStream(String? categoryId) {
    var collectionRef = getEventCollection()
        .where('isFavorite', isEqualTo: true);

    if (categoryId != null) {
        collectionRef = collectionRef.where('categoryId', isEqualTo: categoryId);
    }

    return collectionRef.snapshots();
  }


}
