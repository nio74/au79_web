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
      //  print(risultato);

      return risultato;
    });
  }

  Future<int> readIdRepairId() async {
    var risultato;
    final result = await _firebaseFirestore
        .collection('repairsId')
        .doc('i3XTlDCuIRmFCgrMIe6A')
        .get();

    Map<String, dynamic>? data = result.data();

    data?.forEach((key, value) {
      print('qusta la chiave $key e questo il valore $value');
      risultato = value + 1;
    });
    return risultato;
  }
}
