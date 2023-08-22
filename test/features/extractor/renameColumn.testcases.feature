# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230826a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/renameColumn.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "renameColumn.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.020 (26.08.2023 23:25:18.513 - 26.08.2023 23:25:18.533)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/renameColumn.lfet
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

Feature: extract liquibase element renameColumn

  @recommended
  Scenario: 0001 renameColumn
    renameColumn
    R01 : B01 definition is based on ... format = yaml
    Given 'yaml' based 'renameColumn' changeset
    When  extractor 'renameColumn' is called
    Then  'renameColumn' information is extracted

  @recommended
  Scenario: 0002 renameColumn
    renameColumn
    R02 : B01 definition is based on ... format = xml
    Given 'xml' based 'renameColumn' changeset
    When  extractor 'renameColumn' is called
    Then  'renameColumn' information is extracted

  @recommended
  Scenario: 0003 renameColumn
    renameColumn
    R03 : B01 definition is based on ... format = *
    Given 'json' based 'renameColumn' changeset
    When  extractor 'renameColumn' is called
    Then  Error message 'renameColumn - 20230823.234714 - Format for currentFile.json is not supported.' is logged

### end of generated test cases ###