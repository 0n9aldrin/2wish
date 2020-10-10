import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:two_wish/models/organisation.dart';
import 'package:two_wish/models/success.dart';

class DatabaseService {
  final CollectionReference requestsCollection =
      FirebaseFirestore.instance.collection('requests');
  final CollectionReference globalCollection =
      FirebaseFirestore.instance.collection('global');
  final CollectionReference organisationCollection =
      FirebaseFirestore.instance.collection('organisations');
  final CollectionReference successCollection =
      FirebaseFirestore.instance.collection('success');

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
        .then((value) => value.data()['number']);
  }

  List<Organisation> organisationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Organisation(
        name: doc.data()['Name'] ?? '',
        location: doc.data()['Location'] ?? '',
        description: doc.data()['Description'] ?? '',
        items: doc.data()['Items'] ?? [],
        images: doc.data()['Images'] ?? [],
      );
    }).toList();
  }

  Stream<List<Organisation>> get organisations {
    return organisationCollection.snapshots().map(organisationListFromSnapshot);
  }

  List<Success> successListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Success(
        description: doc.data()['description'] ?? '',
        image: doc.data()['image'] ?? '',
        title: doc.data()['title'] ?? '',
        organisation: doc.data()['organisation'] ?? '',
        date: doc.data()['date'] ?? '',
      );
    }).toList();
  }

  Stream<List<Success>> get success {
    return successCollection.snapshots().map(successListFromSnapshot);
  }
}
