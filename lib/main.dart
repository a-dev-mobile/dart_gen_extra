import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_gen_extra/custom_exceptions.dart';
import 'package:dart_gen_extra/logger.dart';
import 'package:dart_gen_extra/constants.dart' as constants;

const String fileOption = 'file';
const String helpFlag = 'help';
const String verboseFlag = 'verbose';

Future<void> runFromArguments(List<String> arguments) async {
  final ArgParser parser = ArgParser(allowTrailingOptions: true);
  parser
    ..addFlag(helpFlag, abbr: 'h', help: 'Usage help', negatable: false)
    // Make default null to differentiate when it is explicitly set
    ..addOption(
      fileOption,
      abbr: 'f',
      help: 'Path to dart file',
    )
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

  if (argResults[fileOption]) {
    throw NoPathFoundException(
      'No path found in arguments'
      ' use -f and add path ',
    );
  }

  try {
    final filePath = argResults[fileOption]??'';

    final progress = logger.progress('Generate for \n$filePath');

    print('\n✓ Successfully generated extra features');
  } catch (e) {
    stderr.writeln('\n✕ Could not generated extra features');
    stderr.writeln(e);
    exit(2);
  }
}
