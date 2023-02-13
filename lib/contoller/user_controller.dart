import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examfour/model/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'localstore/localStore.dart';

class UserController extends ChangeNotifier{
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  UserModle? user;
  bool isLoading=false;
  getUser() async {
    isLoading=true;
    notifyListeners();
    String? docid=await LocalStore.getDocId();
    var res=await firestore.collection('users').doc(docid).get();
    user=UserModle.fromJson(res.data());
    isLoading=false;
    notifyListeners();
  }
  logOut(VoidCallback onSuccess) async {
    await LocalStore.storeClear();
    onSuccess();
  }
}