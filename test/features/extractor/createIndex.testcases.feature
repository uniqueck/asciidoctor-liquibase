# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230826a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/createIndex.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "createIndex.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.018 (10.09.2023 22:54:31.070 - 10.09.2023 22:54:31.088)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/createIndex.lfet
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

Feature: extract liquibase element createIndex

  @recommended
  Scenario: 0001 createIndex
    createIndex
    R01 : B01 definition is based on ... format = yaml
    Given 'yaml' based 'createIndex' changeset
    When  extractor 'createIndex' is called
    Then  'createIndex' information is extracted

  @recommended
  Scenario: 0002 createIndex
    createIndex
    R02 : B01 definition is based on ... format = *
    Given 'json' based 'createIndex' changeset
    When  extractor 'createIndex' is called
    Then  Error message 'createIndex - 20230910.223507 - Format for currentFile.json is not supported.' is logged

### end of generated test cases ###