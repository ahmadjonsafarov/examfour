import 'package:examfour/model/address_model.dart';

class UserModle{
  final String? name;
  final String? username;
  final String? bio;
  final String? avatar;
  final String? brith;
  final String? password;
  final String? phone;
  final String? gender;
  final AddressModel? addressModel;

  UserModle(
      {required this.name,
      required this.username,
      required this.bio,
      required this.avatar,
      required this.brith,
      required this.password,
      required this.phone,
      required this.gender,
      required this.addressModel});

  factory UserModle.fromJson(Map<String,dynamic>? data){
    return UserModle(
        name: data?["name"],
        username: data?["username"],
        bio: data?["bio"],
        avatar: data?['avatar'],
        brith: data?['brith'],
        password: data?["password"],
        phone: data?["phone"],
        gender: data?["gender"],
        addressModel: data?["addressModel"]!=null? AddressModel.fromJson(data?["addressModel"]):null
    );
  }

  toJson(){
    return{
      'name':name,
      'username':username,
      'phone':phone,
      'password':password,
      'avatar':avatar,
      'bio':bio,
      'brith':brith,
      'gender':gender,
      'addressModel':addressModel?.toJson(),
    };
  }
}
