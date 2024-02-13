import 'package:cloud_firestore/cloud_firestore.dart';

enum StoreCollection {
  summoners('summoners'),
  matches('matches'),
  matchIds('matchIds'),
  ;

  final String path;
  const StoreCollection(this.path);
}

class FirestoreService {
  static final FirestoreService instance = FirestoreService._();

  FirestoreService._();

  final firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> collection([StoreCollection? store]) {
    final path = store == null ? '' : store.path;
    return firestore.collection(path);
  }

  DocumentReference<Map<String, dynamic>> doc(StoreCollection store, String? docPath) {
    final path = store.path;
    return firestore.collection(path).doc(docPath);
  }

  Future<void> writeInDoc(
    String? docPath,
    StoreCollection store,
    Map<String, dynamic> data
  ) async {
    final doc = collection(store).doc(docPath);
    final snapshot = await doc.get();
    if (snapshot.exists) {
      final oldData = snapshot.data() ?? {};
      oldData.addAll(data);
      await doc.update(oldData);
    } else {
      await doc.set(data);
    }
  }
}
