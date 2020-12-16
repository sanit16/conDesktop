import 'package:desktop/data_object/buyer/bucket.dart';
import 'package:desktop/data_tool/pathdata.dart';
import 'package:firebase_database/firebase_database.dart';

class Datacontroller{

  Datacontroller();
  AddBucket(Bucket key){
    DatabaseReference _firebaseRef = new Pathdata().Bucket(null);
    _firebaseRef.push().set(key.toMap());
  }
}