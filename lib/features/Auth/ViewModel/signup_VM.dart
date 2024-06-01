import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neu_normal/data/local/local_storage.dart';

import '../../../core/shared/model/user.dart';

//* Make user object and pass in sharedpreference

class SignupVM extends StateNotifier<bool> {
  SignupVM() : super(true);

  newUser(String username, String pswd) async {
    Map<String, dynamic> userInfo = {};

    ///everytime function is called, bool to define if the user is new is always set true by default
    state = true;

    String? info =
        await LocalStorageService.getString(LocalStorageKeys.userInfo);

    if (info != null) userInfo = jsonDecode(info);

    User user = User.fromMap(userInfo);

    if (username == user.name && pswd == user.password) {
      ///the user is already registered in device memory
      state = false;
    }
  }
}
