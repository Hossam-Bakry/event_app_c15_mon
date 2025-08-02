import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app_c15_mon/models/event_data.dart';

abstract class FirebaseFirestoreUtils {
  static CollectionReference<EventData> _getCollectionReference() {
    return FirebaseFirestore.instance
        .collection(EventData.collectionName)
        .withConverter<EventData>(
          fromFirestore:
              (snapshot, _) => EventData.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toFireStore(),
        );
  }

  static Future<bool> createNewEventTask(EventData eventData) {
    try {
      var collectionReference = _getCollectionReference();
      var documentReference = collectionReference.doc();
      // documentId Auto Generate
      eventData.eventId = documentReference.id;
      documentReference.set(eventData);
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  static Future<List<EventData>> getEventTasksList() async {
    var collectionReference = _getCollectionReference();
    var dataCollection = await collectionReference.get();

    return dataCollection.docs.map((data) {
      return data.data();
    }).toList();
  }

  static Stream<QuerySnapshot<EventData>> getStreamEventTasksList({
    required String categoryId,
  }) {
    log(categoryId);
    var collectionReference = _getCollectionReference().where(
      "eventCategoryId",
      isEqualTo: categoryId,
    );
    return collectionReference.snapshots();
  }

  static Stream<QuerySnapshot<EventData>> getStreamFavouriteEventTasksList() {
    var collectionReference = _getCollectionReference().where(
      "isFavourite",
      isEqualTo: true,
    );
    return collectionReference.snapshots();
  }

  static Future<void> updateEventTask({required EventData eventData}) {
    var collectionRef = _getCollectionReference();
    var docRef = collectionRef.doc(eventData.eventId);
    return docRef.update(eventData.toFireStore());
  }

  static Future<void> deleteEventTask({required EventData eventData}) {
    var collectionRef = _getCollectionReference();
    var docRef = collectionRef.doc(eventData.eventId);
    return docRef.delete();
  }
}
