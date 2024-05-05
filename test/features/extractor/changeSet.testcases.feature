# Diese Datei wurde erzeugt durch LF-ET 2.3.0 (240413a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/changeSet.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "changeSet.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.021 (05.05.2024 22:41:08.799 - 05.05.2024 22:41:08.820)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/changeSet.lfet
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

Feature: extract liquibase element changeSet

  @recommended
  Scenario: 0001 changeSet
    changeSet
    R01 : B01 definition is based on ... format = yaml ; B02 Contains liquibase element changeSet a nested property changes = yaml
    Given 'yaml' based 'changeSet' changeset
    *     changeSet has changes
    When  extractor 'changeSet' is called
    Then  'changeSet' information is extracted

  @recommended
  Scenario: 0002 changeSet
    changeSet
    R02 : B01 definition is based on ... format = yaml ; B02 Contains liquibase element changeSet a nested property changes = *
    Given 'yaml' based 'changeSet' changeset
    When  extractor 'changeSet' is called

  @recommended
  Scenario: 0003 changeSet
    changeSet
    R03 : B01 definition is based on ... format = xml
    Given 'xml' based 'changeSet' changeset
    When  extractor 'changeSet' is called
    Then  'changeSet' information is extracted

  @recommended
  Scenario: 0004 changeSet
    changeSet
    R04 : B01 definition is based on ... format = *
    Given 'json' based 'changeSet' changeset
    When  extractor 'changeSet' is called
    Then  Error message 'changeSet - 20230910.222205 - Format for currentFile.json is not supported.' is logged

### end of generated test cases ###