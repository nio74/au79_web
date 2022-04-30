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
      return snapshot.docs
          .map((doc) => ClientModel.fromSnapshopt(doc))
          .toList();
    });
  }
}
