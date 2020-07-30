import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference requestsCollection =
      Firestore.instance.collection('requests');
  final CollectionReference globalCollection =
      Firestore.instance.collection('global');
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
}
