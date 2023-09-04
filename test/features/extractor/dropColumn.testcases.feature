# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230826a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/dropColumn.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "dropColumn.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.019 (10.09.2023 22:54:31.110 - 10.09.2023 22:54:31.129)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/dropColumn.lfet
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

Feature: extract liquibase element dropColumn

  @recommended
  Scenario: 0001 dropColumn
    dropColumn
    R01 : B01 definition is based on ... format = yaml
    Given 'yaml' based 'dropColumn' changeset
    When  extractor 'dropColumn' is called
    Then  'dropColumn' information is extracted

  @recommended
  Scenario: 0002 dropColumn
    dropColumn
    R02 : B01 definition is based on ... format = xml
    Given 'xml' based 'dropColumn' changeset
    When  extractor 'dropColumn' is called
    Then  'dropColumn' information is extracted

  @recommended
  Scenario: 0003 dropColumn
    dropColumn
    R03 : B01 definition is based on ... format = *
    Given 'json' based 'dropColumn' changeset
    When  extractor 'dropColumn' is called
    Then  Error message 'dropColumn - 20230910.223328 - Format for currentFile.json is not supported.' is logged

### end of generated test cases ###