import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:two_wish/models/organisation.dart';

class DatabaseService {
  final CollectionReference requestsCollection =
      Firestore.instance.collection('requests');
  final CollectionReference globalCollection =
      Firestore.instance.collection('global');
  final CollectionReference organisationCollection =
      Firestore.instance.collection('organisations');

  Future<void> updateRequestsData(
      {String phoneNumber,
      String documentID,
      String itemId,
      int donationAmount,
      String note}) async {
    return await requestsCollection.document(documentID).setData({
      'Phone Number': phoneNumber,
      'Item ID': itemId,
      'Donation amount': donationAmount,
      'Notes': note,
    });
  }

  Future<void> updateRequestNumber({int requestNumber}) async {
    return await globalCollection
        .document('Number of Requests')
        .setData({'number': requestNumber});
  }

  Future<int> getRequestsLength() async {
    return await globalCollection
        .document("Number of Requests")
        .get()
        .then((value) => value.data['number']);
  }

  List<Organisation> organisationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Organisation(
          name: doc.data['Name'] ?? '',
          location: doc.data['Location'] ?? '',
          description: doc.data['Description'] ?? '',
          items: doc.data['Items'] ?? []);
    }).toList();
  }

  Stream<List<Organisation>> get organisations {
    return organisationCollection.snapshots().map(organisationListFromSnapshot);
  }
}
