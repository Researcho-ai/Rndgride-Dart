import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class RndgridUserAuthUser {
  RndgridUserAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserProfileDataStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<RndgridUserAuthUser> rndgridUserAuthUserSubject =
    BehaviorSubject.seeded(RndgridUserAuthUser(loggedIn: false));
Stream<RndgridUserAuthUser> rndgridUserAuthUserStream() =>
    rndgridUserAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
