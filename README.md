# Dart Gen Extra

A command line tool that simplifies the task of generating advanced dart language features. Fully flexible, allowing you to choose (argument -t and value >>> enum_default, enum_string, enum_int, data) where to add new features.

## Setup

The setup of Dart Gen extra is really easy. Just add the following to your `pubspec.yaml`:

```yaml
#  In the future, I will move it to pub dev

dev_dependencies:
  dart_gen_extra:
    git:
      url: https://github.com/a-dev-mobile/dart_gen_extra.git
      ref: master 
```

Then run `flutter pub get` or `dart pub get` to install the package.

You can then add a launch config to your `launch.json` to generate:

```json
        // GEN enum_default
    {
      "label": "GEN enum_default",
      "type": "dart",
      "command": "dart",
      "args": ["run", "dart_gen_extra", "-t", "enum_default", "-f", "${file}"],
    },
        // GEN enum_int
    {
      "label": "GEN enum_int",
      "type": "dart",
      "command": "dart",
      "args": ["run", "dart_gen_extra", "-t", "enum_int", "-f", "${file}"],
    },
        // GEN enum_string    
    {
      "label": "GEN enum_string",
      "type": "dart",
      "command": "dart",
      "args": ["run", "dart_gen_extra", "-t", "enum_string", "-f", "${file}"],
    },
        // GEN data class   
    {
      "label": "GEN data class",
      "type": "dart",
      "command": "dart",
      "args": ["run", "dart_gen_extra", "-t", "data", "-f", "${file}"],
    },
       // GEN assets   
    {
      "label": "GEN assets",
      "type": "dart",
      "command": "dart",
      "args": ["run", "dart_gen_extra", "-t", "assets", "-f", "${workspaceFolder}"]
    },
```
If you will use GEN assets, don't forget to add the path where to generate the file to pubspec:

```yaml
dev_dependencies:
  dart_gen_extra:
...
dart_gen_extra:
  assets_output: "lib/gen/" 
```

## How to use

### Enum

![enum_type](https://github.com/a-dev-mobile/dart_gen_extra/blob/master/resources/enum_type.png)

```shell
dart run dart_gen_extra -t <type_enum> -f <your file>
```

![enum_example](https://github.com/a-dev-mobile/dart_gen_extra/blob/master/resources/enum_example.png)

### Data class

in the works...

### Assets

in the works...

## Help

If you encounter any issues [please report them here](https://github.com/a-dev-mobile/dart_gen_extra/issues).

### License

```
Copyright 2023 Dart Gen Extra

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
