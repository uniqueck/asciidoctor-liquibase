# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230826a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/createTable.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "createTable.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.021 (26.08.2023 23:25:18.384 - 26.08.2023 23:25:18.405)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/createTable.lfet
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

Feature: extract liquibase element createTable

  @recommended
  Scenario: 0001 createTable
    createTable
    R01 : B01 definition is based on ... format = yaml
    Given 'yaml' based 'createTable' changeset
    When  extractor 'createTable' is called
    Then  'createTable' information is extracted

  @recommended
  Scenario: 0002 createTable
    createTable
    R02 : B01 definition is based on ... format = xml
    Given 'xml' based 'createTable' changeset
    When  extractor 'createTable' is called
    Then  'createTable' information is extracted

  @recommended
  Scenario: 0003 createTable
    createTable
    R03 : B01 definition is based on ... format = *
    Given 'json' based 'createTable' changeset
    When  extractor 'createTable' is called
    Then  Error message 'createTable - 20230826.184050 - Format for currentFile.json is not supported.' is logged

### end of generated test cases ###