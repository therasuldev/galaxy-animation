# Galaxy Animation

The Galaxy Animation Flutter package provides an engaging way to display an animated galaxy-like structure in your Flutter applications. This package uses custom painting to create dynamic, rotating planets and orbits.

<img src="https://github.com/therasuldev/galaxy-animation/assets/74558294/3d5796d0-f4df-49ca-b538-6603957b04c9" width = "220" height = "420">

## Features
**Dynamic Galaxy Animation**
- Animates planets rotating around orbits with customizable colors and sizes.
**Customizable Appearance**
- Allows customization of the orbit and planet colors to fit the theme of your application.
**Smooth Animations**
- Utilizes Flutter's animation framework for smooth and efficient rendering.



## Installation

To use this package, add **multi_link_text** as a dependency in your `pubspec.yaml` file.

```bash
dependencies:
  flutter:
    sdk: flutter
  galaxy_animation: ^0.0.1  # Use the latest version
```
‼️ Then run the following commands to fetch the package and update your project:
```bash
flutter pub get
```


## Usage


```dart
import 'package:flutter/material.dart';
import 'package:galaxy_animation/galaxy_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galaxy Animation Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Galaxy Animation'),
        ),
        body: const Center(
          child: GalaxyAnimation(),
        ),
      ),
    );
  }
}


```

## Contributing
Contributions are welcome! Please feel free to submit issues and pull requests.
