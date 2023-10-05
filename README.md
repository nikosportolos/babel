# Babel

#### Translations management for Flutter apps


[![Pub Version](https://img.shields.io/pub/v/babel?color=blue&logo=dart)](https://pub.dev/packages/babel)
[![Pub Publisher](https://img.shields.io/pub/publisher/babel)](https://pub.dev/publishers/nikosportolos.com/packages)
[![Pub Points](https://img.shields.io/pub/points/babel?color=blue&logo=dart)](https://pub.dev/packages/babel)

[![Build](https://github.com/nikosportolos/babel/actions/workflows/build.yml/badge.svg)](https://github.com/nikosportolos/babel/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/nikosportolos/babel/graph/badge.svg?token=EA0DRM7F67)](https://codecov.io/gh/nikosportolos/babel)
[![Language](https://img.shields.io/badge/language-Dart-blue.svg)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)


## Table of Contents

* [Getting started](#getting-started)
* [How to use](#how-to-use)
  * [Add as dependency](#add-as-dependency)
  * [Activate globally](#activate-globally)
* [Commands](#commands)
  * [Base arguments](#base-arguments)
  * [List](#list)
    * [All](#all)
    * [Missing](#missing)
    * [Unused](#unused)
  * [Sort](#sort)
  * [Clean](#clean)
    * [Unused](#clean)
    * [Generated](#generated)
* [Contribution](#contribution)
* [Changelog](#changelog)


## Getting started

<a href="https://raw.githubusercontent.com/nikosportolos/babel/main/assets/images/banner.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/babel/main/assets/images/banner.png" width="600" alt="babel-banner">
</a>


Babel is a command-line interface (CLI) tool crafted to simplify the management 
of translations in Flutter applications. 

This intuitive toolset allows you to effortlessly:

- **List Project's Translations**
  
  Easily examine your project's language resources, identifying existing, 
  missing, or unused translations.

  Utilize the power of [AnsiX](https://pub.dev/packages/ansix) to print reports in 
  data grids, tree views, or JSON format. 
  Additionally, you can export them to files for convenient reference.


- **Sort Translations**

  Keep your translation files organized for enhanced readability and maintainability,
  making it easier for you and your team to work with translations effectively.


- **Clean Generated Files**

  Optimize your project's footprint by removing redundant or 
  unused translation keys, ensuring a lean and efficient application build.


**Babel** is a valuable asset for Flutter developers looking to streamline their localization workflow. 
Its user-friendly interface provides essential functionalities to ensure your project's 
internationalization process is seamless and efficient.


> **Disclaimer**
>
> Please note that **Babel** is specifically designed to work in conjunction with 
> [Flutter's official localization tools](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization). 
> 
> It is not compatible with or intended for use alongside other third-party packages for localization. 
> 
> To ensure seamless functionality and optimal performance, we recommend utilizing Babel exclusively with Flutter's official localization capabilities.


<a href="https://raw.githubusercontent.com/nikosportolos/babel/main/assets/images/examples/list-all-grid.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/babel/main/assets/images/examples/list-all-grid.png" width="750" alt="list-all-grid">
</a>


## How to use

### Add as dependency

```shell
# Add Babel as a dev dependency in your pubspec.yaml
dart pub add -d babel

# Run babel
dart run babel [command] [arguments]
```

### Activate globally

```shell
# Activate Babel from pub.dev
dart pub global activate babel

# Run babel
babel [command] [arguments]
```

## Commands

**Babel** uses [dart_cmder](https://pub.dev/packages/dart_cmder) for the CLI interface.


### Base arguments

| Argument         | Help                                                                    | Allowed values                                                             | Defaults to |
|------------------|-------------------------------------------------------------------------|----------------------------------------------------------------------------|-------------|
| `--path`, `-p`   | The root path of the project where the pubspec.yaml is.                 |                                                                            | `.`         |
| `--level`, `-l`  | Define the level that will be used to filter log messages.              | `none`, `verbose`, `debug`, `info`, `success`, `warning`, `error`, `fatal` | `info`      |
| `--logdir`, `-d` | If not null, then messages will be logged into the specified directory. |                                                                            | `null`      |


### List

| Argument                   | Help                                                               | Allowed values         | Defaults to |
|----------------------------|--------------------------------------------------------------------|------------------------|-------------|
| `--mode`, `-m`             | Defines how the report will be displayed.                          | `grid`, `tree`, `json` | `grid`      |
| `--export-directory`, `-e` | If this field is not empty, it will be used to export the results. |                        |             |


- Grid

<a href="https://raw.githubusercontent.com/nikosportolos/babel/main/assets/images/list-all-grid.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/babel/main/assets/images/list-all-grid.png" width="70%" alt="list-all-grid">
</a>


- Tree

<a href="https://raw.githubusercontent.com/nikosportolos/babel/main/assets/images/list-all-tree.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/babel/main/assets/images/list-all-tree.png" width="50%" alt="list-all-tree">
</a>



- JSON

<a href="https://raw.githubusercontent.com/nikosportolos/babel/main/assets/images/list-all-json.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/babel/main/assets/images/list-all-json.png" width="40%" alt="list-all-json">
</a>



#### All

List all translation keys of the project.

```shell
babel list all
```

#### Missing

List all missing translation keys of the project.

```shell
babel list missing
```

#### Unused

List all unused translation keys of the project.

```shell
babel list unused
```



### Sort

Sorts the translation keys in the arb files of the project.

```shell
babel list sort
```


### Clean

#### Unused

Deletes all unused translation keys.

```shell
babel list clean unused
```

#### Generated

Deletes all generated localization files.

```shell
babel list clean generated
```


## Contribution

Check the [contribution guide](https://github.com/nikosportolos/babel/tree/main/CONTRIBUTING.md)
if you want to help with **dart_cmder**.


## Changelog

Check the [changelog](https://github.com/nikosportolos/babel/tree/main/CHANGELOG.md)
to learn what's new in **dart_cmder**.
