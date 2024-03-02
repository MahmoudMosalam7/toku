import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model.dart';
// hello
final riverpodEasyLevel = StateProvider<int>((ref) {return 0;});
final riverpodHardLevel = ChangeNotifierProvider<RiverpodModel>((ref) {
  return RiverpodModel(counter:0);
});