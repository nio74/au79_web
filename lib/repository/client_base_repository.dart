import 'package:au79_web/model/client_model.dart';

abstract class ClientBaseRepository {
  String idLetto = '';
  Stream<List<ClientModel>> getAllClients();
}
