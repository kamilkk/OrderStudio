fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios generate_projects

```sh
[bundle exec] fastlane ios generate_projects
```

Regenerate the Xcode project from project.yml

### ios dev_start

```sh
[bundle exec] fastlane ios dev_start
```

Close Xcode, regenerate, open the workspace

### ios build_all

```sh
[bundle exec] fastlane ios build_all
```

Build the iOS app

### ios test_all

```sh
[bundle exec] fastlane ios test_all
```

Run package + app tests

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
