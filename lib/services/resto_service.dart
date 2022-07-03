import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_findeat/models/resto_model.dart';

class RestoService {
  final CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('restaurants');

  Future<List<RestoModel>> fetchRestos() async {
    try {
      QuerySnapshot result = await _destinationReference.get();
      List<RestoModel> destinations = result.docs.map((e) {
        return RestoModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinations;
    } catch (e) {
      rethrow;
    }
  }
}
