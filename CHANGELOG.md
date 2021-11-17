# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.2] - 2021-11-17

### Fixed

- `danger-swift` declaration issue that may cause build error when running danger in some environments.

## [0.2.1] - 2021-11-16

### Changed

- DangerDSLCompatible is now deprecated because the interfaces exposed by the protocol are not supposed to be able for users at first place.
  This protocol will be removed at next minor release.

## [0.2.0] - 2021-11-16

### Changed

- Rename SwiftDangerHammer struct to Hammer
- Rename DangerData to DangerDSLCompatible

## [0.1.2] - 2021-11-16

### Changed

- Swift toolchain version is now updated from 5.1 to 5.3

### Fixed

- Plugin unable to be imported by SwiftPM

## [0.1.1] - 2020-08-09

### Fixed

- File diff parsing is now against base branch.

## [0.1.0] - 2020-07-11

### Enhanced

- Add more details in README.md

## [0.0.1] - 2020-07-11

### Added

- An internal method to execute `git diff` command with a file
- A public method to retrieve diff patch to a file
- A public method to retrieve diff lines in a file
