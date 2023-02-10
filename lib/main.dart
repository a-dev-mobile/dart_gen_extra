import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_gen_extra/custom_exceptions.dart';
import 'package:dart_gen_extra/enum_type_run.dart';
import 'package:dart_gen_extra/logger.dart';
import 'package:dart_gen_extra/src/assets_gen/run_assets.dart';
import 'package:dart_gen_extra/src/data_class/run_data_class.dart';

import 'package:dart_gen_extra/src/enum/run_enum_default.dart';
import 'package:dart_gen_extra/src/enum/run_enum_int.dart';
import 'package:dart_gen_extra/src/enum/run_enum_string.dart';

const String fileOption = 'file';
const String typeOption = 'type';
const String helpFlag = 'help';
const String verboseFlag = 'verbose';

Future<void> runFromArguments(List<String> arguments) async {
  final ArgParser parser = ArgParser(allowTrailingOptions: true);
  parser
    ..addFlag(helpFlag, abbr: 'h', help: 'Usage help', negatable: false)
    // Make default null to differentiate when it is explicitly set
    ..addOption(fileOption, abbr: 'f', help: 'Path to dart file')
    ..addOption(typeOption,
        abbr: 't',
        defaultsTo: 'data',
        help: '''What to generate additional features for? - 
enum_default
enum_int
enum_string
data
''')
    ..addFlag(verboseFlag,
        abbr: 'v', help: 'Verbose output', defaultsTo: false);

  final ArgResults argResults = parser.parse(arguments);

  if (argResults[helpFlag]) {
    stdout.writeln('Generates additional features for the dart language');

    stdout.writeln(parser.usage);
    exit(0);
  }
  // creating logger based on -v flag
  final logger = FLILogger(argResults[verboseFlag]);
  logger.progress('Start generate');

  if (argResults[fileOption] == null) {
    throw NoPathFoundException(
      'No path found in arguments'
      ' use -f and add path to dart file',
    );
  }

  try {
    final path = argResults[fileOption].toString();

    logger.info('Path used: $path');

    final typeString = argResults[typeOption].toString();
    final typeRun = TypeRun.fromValue(typeString, fallback: TypeRun.none);
    logger.info('Type of generator used: : ${typeRun.value}');
    switch (typeRun) {
      case TypeRun.enumDefault:
        runEnumDefault(path: path, logger: logger);
        break;
      case TypeRun.enumInt:
        runEnumInt(path: path, logger: logger);
        break;
      case TypeRun.enumString:
        runEnumString(path: path, logger: logger);
        break;

      case TypeRun.data:
        runData(path: path, logger: logger);
        break;
      case TypeRun.assets:
        runAssets(path: path, logger: logger);
        break;
      case TypeRun.none:
        logger.error('Generator type not defined');
        exit(0);
    }
  } catch (e) {
    stderr.writeln('\n✕ Could not generated extra features');
    stderr.writeln(e);
    exit(2);
  }
}
