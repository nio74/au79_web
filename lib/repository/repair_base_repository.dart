import 'package:au79_web/model/repair_model.dart';

abstract class RepairBaserepository {
  Stream<List<RepairModel>> getAllRepairs();
}
