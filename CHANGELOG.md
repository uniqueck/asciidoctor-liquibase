## [1.2.5](https://github.com/uniqueck/asciidoctor-liquibase/compare/v1.2.4...v1.2.5) (2024-05-05)


### Fix

* Ignore all not supported changeset types ([ec84abb](https://github.com/uniqueck/asciidoctor-liquibase/commit/ec84abbde34f409495cb69f25b42dae4420f1cb5))

## [1.2.4](https://github.com/uniqueck/asciidoctor-liquibase/compare/v1.2.3...v1.2.4) (2023-09-14)


### Fix

* wrong keys for foreign key column and table ([469688b](https://github.com/uniqueck/asciidoctor-liquibase/commit/469688b5f4fa05c1ab06f674da6270e4563c54ed))

## [1.2.3](https://github.com/uniqueck/asciidoctor-liquibase/compare/v1.2.2...v1.2.3) (2023-09-10)


### Fix

* missing processing of foreignkey information's on addColumn / createTable changeset (fixes #15) ([4b5d08d](https://github.com/uniqueck/asciidoctor-liquibase/commit/4b5d08d70476895b6c4e4d87ddb050d826a078d4)), closes [#15](https://github.com/uniqueck/asciidoctor-liquibase/issues/15)

### Test

* add cucumber tests for extractor elements ([ef6e72d](https://github.com/uniqueck/asciidoctor-liquibase/commit/ef6e72dedfd1a27866f6034396a6bf75afbef8fa))

## [1.2.2](https://github.com/uniqueck/asciidoctor-liquibase/compare/v1.2.1...v1.2.2) (2023-08-19)


### Fix

* changeset extractor addPrimaryKey (fixes #12) ([488efe8](https://github.com/uniqueck/asciidoctor-liquibase/commit/488efe8049454b0e09798cdbac220d00a472f867)), closes [#12](https://github.com/uniqueck/asciidoctor-liquibase/issues/12)

### Test

* add cucumber test for decision table liquibase-elements ([4fc4eef](https://github.com/uniqueck/asciidoctor-liquibase/commit/4fc4eef34439a0bac19804589f7fa193d983b105))

## [1.2.1](https://github.com/uniqueck/asciidoctor-liquibase/compare/v1.2.0...v1.2.1) (2023-07-05)


### Chore

* Fix eslint configuration and script ([2929965](https://github.com/uniqueck/asciidoctor-liquibase/commit/292996506f8233aca747224005aa66700d636008))
* Fix lint errors & warnings ([76677f8](https://github.com/uniqueck/asciidoctor-liquibase/commit/76677f8bb22ed80aaf39efb335ff5f1e29235e80))

### Fix

* read relative files via antora virtual file system ([515902d](https://github.com/uniqueck/asciidoctor-liquibase/commit/515902d264995302aa5f79521f06b4ee5780a6d1))

# [1.2.0](https://github.com/uniqueck/asciidoctor-liquibase/compare/v1.1.0...v1.2.0) (2023-06-16)


### Build

* add keywords and add changelog to node js package ([c5e10b8](https://github.com/uniqueck/asciidoctor-liquibase/commit/c5e10b85f513b959f741f9e6d1e1689bf3d4a01c))

### Docs

* remove duplicated changelog file in adoc format ([3a65933](https://github.com/uniqueck/asciidoctor-liquibase/commit/3a6593328cd20887385fc854148ee97a321e8314))

### Fix

* extract columns of addColumn changeSet type correctly ([161c14a](https://github.com/uniqueck/asciidoctor-liquibase/commit/161c14a552efc0a09d8228c8f9cafdf3353007f2))

### Update

* Ignore changeSet elements of type update ([703e662](https://github.com/uniqueck/asciidoctor-liquibase/commit/703e6627d828dc582000472e2f0197debc68e9c0))

# [1.1.0](https://github.com/uniqueck/asciidoctor-liquibase/compare/v1.0.1...v1.1.0) (2023-06-16)


### Build

* Fix script in Github Workflow to call semantic release ([d296549](https://github.com/uniqueck/asciidoctor-liquibase/commit/d2965495fe9b717abe5b739ec874cc983e146e05))
* improve release process via `semantic-release` ([8fefbd7](https://github.com/uniqueck/asciidoctor-liquibase/commit/8fefbd7bec6ec46d2a716b263fe5e33ea3cdf51b))

### New

* handle modifyDataType changeSet type ([a78afa6](https://github.com/uniqueck/asciidoctor-liquibase/commit/a78afa6bbcdc4fbc8ad03d8e038e917ff2a878fa))
