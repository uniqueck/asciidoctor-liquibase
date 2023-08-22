# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230826a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/modifyDataType.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "modifyDataType.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.021 (26.08.2023 23:25:18.490 - 26.08.2023 23:25:18.511)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/modifyDataType.lfet
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

Feature: extract liquibase element modifyDataType

  @recommended
  Scenario: 0001 modifyDataType
    modifyDataType
    R01 : B01 definition is based on ... format = yaml
    Given 'yaml' based 'modifyDataType' changeset
    When  extractor 'modifyDataType' is called
    Then  'modifyDataType' information is extracted

  @recommended
  Scenario: 0002 modifyDataType
    modifyDataType
    R02 : B01 definition is based on ... format = xml
    Given 'xml' based 'modifyDataType' changeset
    When  extractor 'modifyDataType' is called
    Then  'modifyDataType' information is extracted

  @recommended
  Scenario: 0003 modifyDataType
    modifyDataType
    R03 : B01 definition is based on ... format = *
    Given 'json' based 'modifyDataType' changeset
    When  extractor 'modifyDataType' is called
    Then  Error message 'modifyDataType - 20230826.183448 - Format for currentFile.json is not supported.' is logged

### end of generated test cases ###