# Workspaces that include a Flutter app cannot also use dart:mirrors.

The analyzer seems to get into a "mirrors OK" or "mirrors not OK" mode and
with workspaces the latter wins out if Flutter is included, thus causing
(spurious) analysis errors for other parts of the mono repo that do use mirrors.

This is using:
```
Dart SDK version: 3.8.1 (stable) (Wed May 28 00:47:25 2025 -0700) on "macos_arm64"
```

```
 dart analyze .
Analyzing ....                         0.9s

  error • cli/bin/cli.dart:1:8 • Target of URI doesn't exist: 'dart:mirrors'. Try creating the file referenced by the URI, or try using a URI for a file that
          does exist. • uri_does_not_exist
  error • cli/bin/cli.dart:4:24 • The function 'currentMirrorSystem' isn't defined. Try importing the library that defines 'currentMirrorSystem', correcting
          the name to the name of an existing function, or defining a function named 'currentMirrorSystem'. • undefined_function

2 issues found.
```

If you remove "app" from the workspace, then this problem goes away.