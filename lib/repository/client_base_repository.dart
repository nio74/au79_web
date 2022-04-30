import 'package:au79_web/model/client_model.dart';

abstract class ClientBaseRepository {
  Stream<List<ClientModel>> getAllClients();
}
