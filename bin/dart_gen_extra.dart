import 'package:dart_gen_extra/constants.dart';
import 'package:dart_gen_extra/main.dart' as dart_gen_extra;
import 'package:dart_gen_extra/src/version.dart';

void main(List<String> arguments) {
  print(introMessage(packageVersion));
  dart_gen_extra.runFromArguments(arguments);
}
