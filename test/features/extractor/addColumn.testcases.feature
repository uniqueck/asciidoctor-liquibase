# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230826a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/addColumn.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "addColumn.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.021 (14.09.2023 14:11:35.709 - 14.09.2023 14:11:35.730)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/addColumn.lfet
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

Feature: extract liquibase element addColumn

  @recommended
  Scenario: 0001 addColumn
    addColumn
    R01 : B01 definition is based on ... format = yaml
    Given 'yaml' based 'addColumn' changeset
    When  extractor 'addColumn' is called
    Then  'addColumn' information is extracted

  @recommended
  Scenario: 0002 addColumn
    addColumn
    R02 : B01 definition is based on ... format = xml
    Given 'xml' based 'addColumn' changeset
    When  extractor 'addColumn' is called
    Then  'addColumn' information is extracted

  @recommended
  Scenario: 0003 addColumn
    addColumn
    R03 : B01 definition is based on ... format = *
    Given 'json' based 'addColumn' changeset
    When  extractor 'addColumn' is called
    Then  Error message 'addColumn - 20230909.210655 - Format for currentFile.json is not supported.' is logged

### end of generated test cases ###