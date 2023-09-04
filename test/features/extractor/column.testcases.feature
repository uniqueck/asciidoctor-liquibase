# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230826a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/column.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -SwitchCoverage "1" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "column.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.065 (10.09.2023 22:54:30.999 - 10.09.2023 22:54:31.064)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/column.lfet
# 
# TestValueGroups: Cucumber, *ti.att.Cucumber, *ti.gtd.Cucumber, *ti.check.Cucumber
# Config: Config
# 
# Testfälle mit Fehlern: 0
# 
# Testfälle mit Warnungen: 0
# 
# Informationen: 1
# 
#     1. /opt/data/github/asciidoctor/asciidoctor-liquibase/test/features/testdata/formats.gtd.txt
#            Erfolgreich eingelesen: Formats, 3 Sätze, Encoding UTF-8
#         /opt/data/github/asciidoctor/asciidoctor-liquibase/test/features/testdata/liquibase-elements.gtd.txt
#            Erfolgreich eingelesen: Tags, 3 Sätze, Encoding UTF-8

# language: en

Feature: extract liquibase element column

  @recommended
  Scenario: 0001 column
    column
    R01 : B02 definition is based on ... format = yaml
    R04 : B03 exist constraints element = Y ; B04 exists primaryKey information = Y ; B05 exists foreignKey information = Y
    Given 'yaml' based column changeset
    *     sub tag 'constraints' exists
    *     foreign key information are present
    When  extractor column is called
    Then  extracted column name is 'columnName'
    *     extracted column type is 'varchar'
    *     extracted primaryKey information is set to true
    *     extracted foreign key information is set

  @recommended
  Scenario: 0002 column
    column
    R01 : B02 definition is based on ... format = yaml
    R05 : B03 exist constraints element = Y ; B04 exists primaryKey information = Y ; B05 exists foreignKey information = N
    Given 'yaml' based column changeset
    *     sub tag 'constraints' exists
    When  extractor column is called
    Then  extracted column name is 'columnName'
    *     extracted column type is 'varchar'
    *     extracted primaryKey information is set to true

  @recommended
  Scenario: 0003 column
    column
    R01 : B02 definition is based on ... format = yaml
    R06 : B03 exist constraints element = Y ; B04 exists primaryKey information = N ; B05 exists foreignKey information = Y
    Given 'yaml' based column changeset
    *     sub tag 'constraints' exists
    *     foreign key information are present
    When  extractor column is called
    Then  extracted column name is 'columnName'
    *     extracted column type is 'varchar'
    *     extracted primaryKey information is set to true
    *     extracted foreign key information is set

  @recommended
  Scenario: 0004 column
    column
    R01 : B02 definition is based on ... format = yaml
    R07 : B03 exist constraints element = Y ; B04 exists primaryKey information = N ; B05 exists foreignKey information = N
    Given 'yaml' based column changeset
    *     sub tag 'constraints' exists
    When  extractor column is called
    Then  extracted column name is 'columnName'
    *     extracted column type is 'varchar'
    *     extracted primaryKey information is set to true

  @recommended
  Scenario: 0005 column
    column
    R01 : B02 definition is based on ... format = yaml
    R08 : B03 exist constraints element = N
    Given 'yaml' based column changeset
    When  extractor column is called
    Then  extracted column name is 'columnName'
    *     extracted column type is 'varchar'
    *     extracted primaryKey information is set to false

  @recommended
  Scenario: 0006 column
    column
    R02 : B02 definition is based on ... format = xml
    R04 : B03 exist constraints element = Y ; B04 exists primaryKey information = Y ; B05 exists foreignKey information = Y
    Given 'xml' based column changeset
    *     sub tag 'constraints' exists
    *     foreign key information are present
    When  extractor column is called
    Then  extracted column name is 'columnName'
    *     extracted column type is 'int'
    *     extracted primaryKey information is set to true
    *     extracted foreign key information is set

  @recommended
  Scenario: 0007 column
    column
    R02 : B02 definition is based on ... format = xml
    R05 : B03 exist constraints element = Y ; B04 exists primaryKey information = Y ; B05 exists foreignKey information = N
    Given 'xml' based column changeset
    *     sub tag 'constraints' exists
    When  extractor column is called
    Then  extracted column name is 'columnName'
    *     extracted column type is 'int'
    *     extracted primaryKey information is set to true

  @recommended
  Scenario: 0008 column
    column
    R02 : B02 definition is based on ... format = xml
    R06 : B03 exist constraints element = Y ; B04 exists primaryKey information = N ; B05 exists foreignKey information = Y
    Given 'xml' based column changeset
    *     sub tag 'constraints' exists
    *     foreign key information are present
    When  extractor column is called
    Then  extracted column name is 'columnName'
    *     extracted column type is 'int'
    *     extracted primaryKey information is set to true
    *     extracted foreign key information is set

  @recommended
  Scenario: 0009 column
    column
    R02 : B02 definition is based on ... format = xml
    R07 : B03 exist constraints element = Y ; B04 exists primaryKey information = N ; B05 exists foreignKey information = N
    Given 'xml' based column changeset
    *     sub tag 'constraints' exists
    When  extractor column is called
    Then  extracted column name is 'columnName'
    *     extracted column type is 'int'
    *     extracted primaryKey information is set to true

  @recommended
  Scenario: 0010 column
    column
    R02 : B02 definition is based on ... format = xml
    R08 : B03 exist constraints element = N
    Given 'xml' based column changeset
    When  extractor column is called
    Then  extracted column name is 'columnName'
    *     extracted column type is 'int'
    *     extracted primaryKey information is set to false

  @recommended
  Scenario: 0011 column
    column
    R03 : B02 definition is based on ... format = *
    Given 'json' based 'column' changeset
    When  extractor column is called
    Then  Error message 'column - 20230910.225304 - Format for currentFile.json is not supported.' is logged

### end of generated test cases ###