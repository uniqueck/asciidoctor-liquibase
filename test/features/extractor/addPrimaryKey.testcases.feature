# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230819A) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/addPrimaryKey.lfet" -Group "Cucumber" -Config "Config" -GtdDirectory "../../test/features/testdata/" -GtdFileNamePattern "*.txt; *.csv" -NonExecutableRules "50" -RecommendedTestCases -Protocol -ForceProtocol -OutGherkin "addPrimaryKey.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.046 (19.08.2023 18:11:44.176 - 19.08.2023 18:11:44.222)
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
    R01 : B01=yaml
    Given 'yaml' based 'addPrimaryKey' changeset
    When  extractor 'addPrimaryKey' is called
    Then  'addPrimaryKey' information is extracted

  @recommended
  Scenario: 0002 addPrimaryKey
    addPrimaryKey
    R02 : B01=xml
    Given 'xml' based 'addPrimaryKey' changeset
    When  extractor 'addPrimaryKey' is called
    Then  'addPrimaryKey' information is extracted

  @recommended
  Scenario: 0003 addPrimaryKey
    addPrimaryKey
    R03 : B01=*
    Given 'json' based 'addPrimaryKey' changeset
    When  extractor 'addPrimaryKey' is called
    Then  Error message 'addPrimaryKey - 20230819.180326 - Format for currentFile.json is not supported.' is logged
