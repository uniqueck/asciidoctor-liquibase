# Diese Datei wurde erzeugt durch LF-ET 2.3.0 (240413a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/include.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "include.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.024 (05.05.2024 22:41:09.011 - 05.05.2024 22:41:09.035)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/include.lfet
# 
# Regelauswahl und Regelsortierung: Alle Regeln, Standardsortierung
# 
# TestValueGroups: Cucumber, *ti.att.Cucumber, *ti.gtd.Cucumber
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

Feature: extract liquibase element include

  @recommended
  Scenario: 0001 include
    include
    R01 : B01 definition is based on ... format = yaml ; B02 yaml based definition - file extension = yaml
    Given 'yaml' based include changeset with target include file extension 'yaml'
    When  extractor 'include' is called

  @recommended
  Scenario: 0002 include
    include
    R02 : B01 definition is based on ... format = yaml ; B02 yaml based definition - file extension = xml
    Given 'yaml' based include changeset with target include file extension 'xml'
    When  extractor 'include' is called
    Then  Error message 'include - 20230910.223434 - 2 / 7 - Mixed liquibase base definitions is not supported.' is logged

  @recommended
  Scenario: 0003 include
    include
    R03 : B01 definition is based on ... format = yaml ; B02 yaml based definition - file extension = *
    Given 'yaml' based include changeset with target include file extension 'json'
    When  extractor 'include' is called
    Then  Error message 'include - 20230910.223434 - 3 / 7 - YAML liquibase definition unknown file extension.' is logged

  @recommended
  Scenario: 0004 include
    include
    R04 : B01 definition is based on ... format = xml ; B03 xml based definition - file extension = yaml
    Given 'xml' based include changeset with target include file extension 'yaml'
    When  extractor 'include' is called
    Then  Error message 'include - 20230910.223434 - 4 / 7 - Mixed liquibase base definitions is not supported.' is logged

  @recommended
  Scenario: 0005 include
    include
    R05 : B01 definition is based on ... format = xml ; B03 xml based definition - file extension = xml
    Given 'xml' based include changeset with target include file extension 'xml'
    When  extractor 'include' is called

  @recommended
  Scenario: 0006 include
    include
    R06 : B01 definition is based on ... format = xml ; B03 xml based definition - file extension = *
    Given 'xml' based include changeset with target include file extension 'json'
    When  extractor 'include' is called
    Then  Error message 'include - 20230910.223434 - 6 / 7 - XML liquibase definition unknown file extension.' is logged

  @recommended
  Scenario: 0007 include
    include
    R07 : B01 definition is based on ... format = *
    Given 'json' based include changeset with target include file extension 'json'
    When  extractor 'include' is called
    Then  Error message 'include - 20230910.223434 - 7 / 7 - Format for \'currentFile.json\' is not supported.' is logged

### end of generated test cases ###