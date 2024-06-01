import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neu_normal/core/shared/model/user.dart';
import 'package:neu_normal/data/local/local_storage.dart';

class GetUserVM extends StateNotifier<User> {
  GetUserVM() : super(User(interests: [], name: '', password: ''));

  /// method to store the user object from local storage
  getUser() async {
    log('working?');
    final user = await LocalStorageService.getString(LocalStorageKeys.userInfo);
    state = User.fromMap(jsonDecode(user!));
  }
}
