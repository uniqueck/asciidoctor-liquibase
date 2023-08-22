# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230826a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/liquibase-parser.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -SwitchCoverage "2" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "liquibase-parser.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.252 (26.08.2023 23:25:18.006 - 26.08.2023 23:25:18.258)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/liquibase-parser.lfet
# 
# TestValueGroups: Cucumber, *ti.att.Cucumber, *ti.gtd.Cucumber, *ti.check.Cucumber
# Config: Config
# 
# Testfälle mit Fehlern: 0
# 
# Testfälle mit Warnungen: 0
# 
# Informationen: 0

# language: en

Feature: Parse elements in Liquibase changelog files

  @ignore @recommended
  Scenario: 0001 liquibase-parser
    liquibase-parser
    R01 : B02 One more element to process = Y ; B05 changeset format = xml
    R05 : B03 Element should ignored = Y
    R01 : B02 One more element to process = Y ; B05 changeset format = xml
    R05 : B03 Element should ignored = Y
    R01 : B02 One more element to process = Y ; B05 changeset format = xml
    R05 : B03 Element should ignored = Y
    R01 : B02 One more element to process = Y ; B05 changeset format = xml
    R05 : B03 Element should ignored = Y
    When  liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called

  @ignore @recommended
  Scenario: 0002 liquibase-parser
    liquibase-parser
    R01 : B02 One more element to process = Y ; B05 changeset format = xml
    R06 : B03 Element should ignored = N ; B04 Processing finished = Y
    When  liquibase-parser is called
    *     liquibase-parser is called

  @ignore @recommended
  Scenario: 0003 liquibase-parser
    liquibase-parser
    R01 : B02 One more element to process = Y ; B05 changeset format = xml
    R07 : B03 Element should ignored = N ; B04 Processing finished = N
    R09 : B04 Processing finished = N
    R01 : B02 One more element to process = Y ; B05 changeset format = xml
    R07 : B03 Element should ignored = N ; B04 Processing finished = N
    R09 : B04 Processing finished = N
    R01 : B02 One more element to process = Y ; B05 changeset format = xml
    R07 : B03 Element should ignored = N ; B04 Processing finished = N
    R09 : B04 Processing finished = N
    R01 : B02 One more element to process = Y ; B05 changeset format = xml
    R07 : B03 Element should ignored = N ; B04 Processing finished = N
    R09 : B04 Processing finished = N
    R01 : B02 One more element to process = Y ; B05 changeset format = xml
    When  liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called

  @ignore @recommended
  Scenario: 0004 liquibase-parser
    liquibase-parser
    R02 : B02 One more element to process = Y ; B05 changeset format = yaml
    R05 : B03 Element should ignored = Y
    R02 : B02 One more element to process = Y ; B05 changeset format = yaml
    R05 : B03 Element should ignored = Y
    R02 : B02 One more element to process = Y ; B05 changeset format = yaml
    R05 : B03 Element should ignored = Y
    R02 : B02 One more element to process = Y ; B05 changeset format = yaml
    R05 : B03 Element should ignored = Y
    When  liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called

  @ignore @recommended
  Scenario: 0005 liquibase-parser
    liquibase-parser
    R02 : B02 One more element to process = Y ; B05 changeset format = yaml
    R06 : B03 Element should ignored = N ; B04 Processing finished = Y
    When  liquibase-parser is called
    *     liquibase-parser is called

  @ignore @recommended
  Scenario: 0006 liquibase-parser
    liquibase-parser
    R02 : B02 One more element to process = Y ; B05 changeset format = yaml
    R07 : B03 Element should ignored = N ; B04 Processing finished = N
    R09 : B04 Processing finished = N
    R02 : B02 One more element to process = Y ; B05 changeset format = yaml
    R07 : B03 Element should ignored = N ; B04 Processing finished = N
    R09 : B04 Processing finished = N
    R02 : B02 One more element to process = Y ; B05 changeset format = yaml
    R07 : B03 Element should ignored = N ; B04 Processing finished = N
    R09 : B04 Processing finished = N
    R02 : B02 One more element to process = Y ; B05 changeset format = yaml
    R07 : B03 Element should ignored = N ; B04 Processing finished = N
    R09 : B04 Processing finished = N
    R02 : B02 One more element to process = Y ; B05 changeset format = yaml
    When  liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called
    *     liquibase-parser is called

### end of generated test cases ###