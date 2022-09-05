import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:au79_web/model/client_model.dart';
import 'package:au79_web/repository/client_base_repository.dart';

class ClientRepository extends ClientBaseRepository {
  final FirebaseFirestore _firebaseFirestore;

  ClientRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<ClientModel>> getAllClients() {
    return _firebaseFirestore.collection('clients').snapshots().map((snapshot) {
      final risultato =
          snapshot.docs.map((doc) => ClientModel.fromSnapshot(doc)).toList();
      print(risultato);

      return risultato;
    });
  }

  final _fireStore = FirebaseFirestore.instance;
  Future<List<ClientModel>> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _fireStore.collection('clients').get();

    // Get data from docs and convert map to List
    final allData =
        querySnapshot.docs.map((doc) => ClientModel.fromSnapshot(doc)).toList();
    return allData;

    print(allData);
  }

  Future<void> addClient(List<ClientModel> clientData) async {
    var resultList = [];
    for (ClientModel item in clientData) {
      resultList.add(
          await _firebaseFirestore.collection("clients").add(item.toMap()));
    }
  }

  Future<void> addClient2(List<ClientModel> clientData) async {
    try {
      clientData.forEach((client) {
        _firebaseFirestore.collection('clients').doc(client.id.toString()).set({
          'id': client.id,
          'nameClient': client.nameClient,
          'address': client.address,
        });
      });
    } catch (e) {
      // ignore: avoid_print
      print("Error InsertData method addClient2 $e");
    }
  }

  Future<String> readIdClient() async {
    var risultato;
    final result = await _firebaseFirestore
        .collection('clientId')
        .doc('HO3SxQEdhUtsTJ6VNI4e')
        .get();

    Map<String, dynamic>? data = result.data();

    data?.forEach((key, value) {
      print('qusta la chiave $key e questo il valore $value');
      risultato = value + 1;
    });
    return risultato.toString();
  }

  /* Future<String> readIdClient() async {
    String risultato = 'prova vuoto maledettol';

    return Future.delayed(const Duration(seconds: 2), () => risultato);

    //print('risultato di readIdClient$data');
  } */

  Future<String?> incrementId() async {
    try {
      var nuovoId =
          _firebaseFirestore.collection('clientId').doc('HO3SxQEdhUtsTJ6VNI4e');

      return nuovoId.update({'idClient': FieldValue.increment(1)}).toString();

      print('questo e il nuovo codice $nuovoId');
    } catch (e) {
      print('prova incremento Id fallita  $e');
      return '';
    }
  }
}
