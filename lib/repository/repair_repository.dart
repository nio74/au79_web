import 'package:au79_web/model/repair_model.dart';
import 'package:au79_web/repository/repair_base_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RepairRepository extends RepairBaserepository {
  final FirebaseFirestore _firebaseFirestore;

  RepairRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<RepairModel>> getAllRepairs() {
    return _firebaseFirestore.collection('repairs').snapshots().map((snapshot) {
      final risultato =
          snapshot.docs.map((doc) => RepairModel.fromSnapshot(doc)).toList();
      print(risultato);

      return risultato;
    });
  }
}
