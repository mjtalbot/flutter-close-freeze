# Desktop app freeze

A Flutter project to show how the flutter desktop app freezes when trying to close it on. 

# Steps to reproduce. 

Run application

`flutter run -d macos` 

Close application from menu bar

# Reproduces on

flutter --version
Flutter 3.7.0-17.0.pre.24 • channel master • https://github.com/flutter/flutter.git
Framework • revision 957781a108 (2 hours ago) • 2023-01-11 04:04:39 -0500
Engine • revision 6256f05db1
Tools • Dart 3.0.0 (build 3.0.0-109.0.dev) • DevTools 2.20.0

rive % flutter --version
Flutter 3.7.0-15.0.pre • channel unknown • unknown source
Framework • revision a02b9d2bff (2 days ago) • 2023-01-09 10:29:26 -0800
Engine • revision 51baed6e01
Tools • Dart 3.0.0 (build 3.0.0-97.0.dev) • DevTools 2.20.0

# does not repro on

flutter --version
Flutter 3.7.0-1.3.pre • channel beta • https://github.com/flutter/flutter.git
Framework • revision 9b4416aaa7 (7 days ago) • 2023-01-04 17:29:34 -0600
Engine • revision 7b8906637f
Tools • Dart 2.19.0 (build 2.19.0-444.3.beta) • DevTools 2.20.0



