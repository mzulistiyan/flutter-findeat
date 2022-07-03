import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_findeat/models/riview_model.dart';

class RiviewService {
  CollectionReference _riviewReference =
      FirebaseFirestore.instance.collection('riviews');

  Future<void> createRiview(
    RiviewModel riview,
  ) async {
    try {
      _riviewReference.add({
        'teks': riview.teks,
        'name': riview.name,
        'idResto': riview.idResto,
      }).then((value) => print('Success ' + value.id));
    } catch (e) {
      throw e;
    }
  }

  Future<List<RiviewModel>> fetchRiview(String idResto) async {
    try {
      QuerySnapshot result =
          await _riviewReference.where('idResto', isEqualTo: idResto).get();
      List<RiviewModel> riview = result.docs.map((e) {
        return RiviewModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return riview;
    } catch (e) {
      rethrow;
    }
  }
}
