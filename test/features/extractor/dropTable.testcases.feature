# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230826a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/dropTable.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "dropTable.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.022 (26.08.2023 23:25:18.428 - 26.08.2023 23:25:18.450)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/dropTable.lfet
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

Feature: extract liquibase element dropTable

  @recommended
  Scenario: 0001 dropTable
    dropTable
    R01 : B01 definition is based on ... format = yaml
    Given 'yaml' based 'dropTable' changeset
    When  extractor 'dropTable' is called
    Then  'dropTable' information is extracted

  @recommended
  Scenario: 0002 dropTable
    dropTable
    R02 : B01 definition is based on ... format = xml
    Given 'xml' based 'dropTable' changeset
    When  extractor 'dropTable' is called
    Then  'dropTable' information is extracted

  @recommended
  Scenario: 0003 dropTable
    dropTable
    R03 : B01 definition is based on ... format = *
    Given 'json' based 'dropTable' changeset
    When  extractor 'dropTable' is called
    Then  Error message 'dropTable - 20230826.183835 - Format for currentFile.json is not supported.' is logged

### end of generated test cases ###