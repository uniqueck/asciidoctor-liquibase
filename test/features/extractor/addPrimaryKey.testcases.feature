# Diese Datei wurde erzeugt durch LF-ET 2.3.0 (240413a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/addPrimaryKey.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "addPrimaryKey.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.020 (05.05.2024 22:41:08.777 - 05.05.2024 22:41:08.797)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/addPrimaryKey.lfet
# 
# Regelauswahl und Regelsortierung: Alle Regeln, Standardsortierung
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

Feature: extract liquibase element addPrimaryKey

  @recommended
  Scenario: 0001 addPrimaryKey
    addPrimaryKey
    R01 : B01 definition is based on ... format = yaml
    Given 'yaml' based 'addPrimaryKey' changeset
    When  extractor 'addPrimaryKey' is called
    Then  'addPrimaryKey' information is extracted

  @recommended
  Scenario: 0002 addPrimaryKey
    addPrimaryKey
    R02 : B01 definition is based on ... format = xml
    Given 'xml' based 'addPrimaryKey' changeset
    When  extractor 'addPrimaryKey' is called
    Then  'addPrimaryKey' information is extracted

  @recommended
  Scenario: 0003 addPrimaryKey
    addPrimaryKey
    R03 : B01 definition is based on ... format = *
    Given 'json' based 'addPrimaryKey' changeset
    When  extractor 'addPrimaryKey' is called
    Then  Error message 'addPrimaryKey - 20230910.223007 - Format for currentFile.json is not supported.' is logged

### end of generated test cases ###