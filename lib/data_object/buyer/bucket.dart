import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Bucket {
  String runno;
  int companyrunno;
  bool complete;
  String status;
  String createdate;
  int createuser;
  String updatedate;
  int updateuser;
  bool active;
  bool delete;

  Bucket(
      this.companyrunno,
      this.complete,
      this.status,
      this.createdate,
      this.createuser,
      this.updatedate,
      this.updateuser,
      this.active,
      this.delete);

  Bucket.fromSnapshot(DataSnapshot snapshot)
      : this.runno = snapshot.key,
        this.companyrunno = snapshot.value["companyrunno"],
        this.complete = snapshot.value["complete"],
        this.status = snapshot.value["status"],
        this.createdate = snapshot.value["createdate"],
        this.createuser = snapshot.value["createuser"],
        this.updatedate = snapshot.value["updatedate"],
        this.updateuser = snapshot.value["updateuser"],
        this.active = snapshot.value["userId"],
        this.delete = snapshot.value["userId"];

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'runno': this.runno,
      'companyrunno': this.companyrunno,
      'complete': this.complete,
      'status': this.status,
      'createdate': this.createdate,
      'createuser': this.createuser,
      'updatedate': this.updatedate,
      'updateuser': this.updateuser,
      'active': this.active,
      'delete': this.delete,
    } as Map<String, dynamic>;
  }
}
