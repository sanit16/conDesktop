import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Pathdata{
  Pathdata();
  DatabaseReference  Bucket(String key){
    DatabaseReference  ref = FirebaseDatabase.instance.reference();
     String id = FirebaseAuth.instance.currentUser.uid;
    return ref.child("bucket").child(id).child(key) ;
  }
  dynamic BucketDetail(String key){
    final ref = FirebaseDatabase.instance.reference();
    String id = FirebaseAuth.instance.currentUser.uid;
    if(key==null){
      return ref.child("bucket").child(id) ;

    }else{
      return ref.child("bucket").child(id).child(key) ;

    }
  }
  dynamic Buyer(String key){

  }

}