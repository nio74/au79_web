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

  Future createClient() async {
    final int id;
    final String address;
    final String nameClient;
    final CollectionReference docClient =
        FirebaseFirestore.instance.collection('clients');

    return docClient
        .doc('miachiave')
        .set({'id': 3, 'address': "via mia", 'clientName': "Porcospino"});
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

  Future<void> readIdClient() async {
    var risultato = await _firebaseFirestore
        .collection('clientId')
        .doc('HO3SxQEdhUtsTJ6VNI4e')
        .get();
    if (risultato.exists) {
      Map<String, dynamic>? data = risultato.data();
      var value = data?['idClient'];
      print('codece id del cliente  $value');
      return value;
    }
  }

  int incrementId() {
    try {
      int nuovoId = _firebaseFirestore
          .collection('clientId')
          .doc('HO3SxQEdhUtsTJ6VNI4e')
          .update({'idClient': FieldValue.increment(1)}) as int;
      return nuovoId;
      //print('questo e il nuovo codice $risultato');
    } catch (e) {
      print('prova incremento Id fallita  $e');
    }
  }
}
