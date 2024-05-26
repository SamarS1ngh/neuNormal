import 'package:fluttemp/ViewModel/someClass_VM/someclass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<SomeChangenotifierClass, int>(
    (ref) => SomeChangenotifierClass());
  // static List<SingleChildWidget> providers = [
  //   ChangeNotifierProvider(create: (_) => SomeChangenotifierClass()),
  // ];

