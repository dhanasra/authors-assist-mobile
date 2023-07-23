// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {

  final String id;
  final String? firstName;
  final String? lastName;
  final String? location;
  final String? email;
  final bool emailVerified;
  final String uid;
  final String? photo;
  final String? provider;
  final int authType;
  final DateTime lastLogin;
  final DateTime created;
  final DateTime updated;
  final String? blogger;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.location,
    this.email,
    required this.emailVerified,
    required this.uid,
    this.photo,
    this.provider,
    required this.authType,
    required this.lastLogin,
    required this.created,
    required this.updated,
    required this.blogger,
  });



  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? location,
    String? email,
    bool? emailVerified,
    String? uid,
    String? photo,
    String? provider,
    int? authType,
    DateTime? lastLogin,
    DateTime? created,
    DateTime? updated,
    String? blogger,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      location: location ?? this.location,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      uid: uid ?? this.uid,
      photo: photo ?? this.photo,
      provider: provider ?? this.provider,
      authType: authType ?? this.authType,
      lastLogin: lastLogin ?? this.lastLogin,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      blogger: blogger ?? this.blogger,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'email': email,
      'emailVerified': emailVerified,
      'uid': uid,
      'photo': photo,
      'provider': provider,
      'authType': authType,
      'lastLogin': lastLogin.millisecondsSinceEpoch,
      'created': created.millisecondsSinceEpoch,
      'updated': updated.millisecondsSinceEpoch,
      'blogger': blogger,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      firstName: map['firstName'],
      lastName: map['lastName'],
      location: map['location'] != null ? map['location'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      emailVerified: map['emailVerified'] as bool,
      uid: map['uid'] as String,
      photo: map['photo'] != null ? map['photo'] as String : null,
      provider: map['provider'] != null ? map['provider'] as String : null,
      authType: map['authType'] as int,
      lastLogin: DateTime.parse(map['lastLogin']),
      created: DateTime.parse(map['created']),
      updated: DateTime.parse(map['updated']),
      blogger: map['blogger'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      firstName??'',
      lastName??'',
      location??'',
      email??'',
      emailVerified,
      uid,
      photo??'',
      provider??'',
      authType,
      lastLogin,
      created,
      updated,
      blogger??'',
    ];
  }
}
