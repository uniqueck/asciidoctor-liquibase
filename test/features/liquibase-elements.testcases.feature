# Diese Datei wurde erzeugt durch LF-ET 2.2.1 (230826a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/liquibase-elements.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../test/features/testdata" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "liquibase-elements.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.278 (10.09.2023 22:54:30.318 - 10.09.2023 22:54:30.596)
# 
# Entscheidungstabelle: /opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/liquibase-elements.lfet
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

Feature: Analyze Liquibase element based on name

  @recommended
  Scenario: 0001 liquibase-elements
    liquibase-elements
    R01 : B01 Liquibase element name is ... = addDefaultValue
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'addDefaultValue'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'addDefaultValue'

  @recommended
  Scenario: 0002 liquibase-elements
    liquibase-elements
    R02 : B01 Liquibase element name is ... = loadData
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'loadData'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'loadData'

  @recommended
  Scenario: 0003 liquibase-elements
    liquibase-elements
    R03 : B01 Liquibase element name is ... = insert
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'insert'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'insert'

  @recommended
  Scenario: 0004 liquibase-elements
    liquibase-elements
    R04 : B01 Liquibase element name is ... = sql
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'sql'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'sql'

  @recommended
  Scenario: 0005 liquibase-elements
    liquibase-elements
    R05 : B01 Liquibase element name is ... = sqlFile
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'sqlFile'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'sqlFile'

  @recommended
  Scenario: 0006 liquibase-elements
    liquibase-elements
    R06 : B01 Liquibase element name is ... = preConditions
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'preConditions'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'preConditions'

  @recommended
  Scenario: 0007 liquibase-elements
    liquibase-elements
    R07 : B01 Liquibase element name is ... = property
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'property'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'property'

  @recommended
  Scenario: 0008 liquibase-elements
    liquibase-elements
    R08 : B01 Liquibase element name is ... = tagDatabase ; B02 tag = tillTag = Y
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'tagDatabase' with tag 'V2.0.0'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  processing is finished
    *     element name is 'tagDatabase'

  @recommended
  Scenario: 0009 liquibase-elements
    liquibase-elements
    R09 : B01 Liquibase element name is ... = tagDatabase ; B02 tag = tillTag = N
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'tagDatabase' with tag 'V3.0.0'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  element should ignored from processing
    *     processing is not finished
    *     element name is 'tagDatabase'

  @recommended
  Scenario: 0010 liquibase-elements
    liquibase-elements
    R10 : B01 Liquibase element name is ... = addForeignKeyConstraint
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'addForeignKeyConstraint'
    When  liquibase-elements is called without tillTag defined
    Then  processing is not finished
    *     element name is 'addForeignKeyConstraint'

  @recommended
  Scenario: 0011 liquibase-elements
    liquibase-elements
    R11 : B01 Liquibase element name is ... = addUniqueConstraint
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'addUniqueConstraint'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'addUniqueConstraint'

  @recommended
  Scenario: 0012 liquibase-elements
    liquibase-elements
    R12 : B01 Liquibase element name is ... = rollback
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'rollback'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'rollback'

  @recommended
  Scenario: 0013 liquibase-elements
    liquibase-elements
    R13 : B01 Liquibase element name is ... = dropColumn
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'dropColumn'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  processing is not finished
    *     element name is 'dropColumn'

  @recommended
  Scenario: 0014 liquibase-elements
    liquibase-elements
    R14 : B01 Liquibase element name is ... = addColumn
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'addColumn'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  processing is not finished
    *     element name is 'addColumn'

  @recommended
  Scenario: 0015 liquibase-elements
    liquibase-elements
    R15 : B01 Liquibase element name is ... = comment
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'comment'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'comment'

  @recommended
  Scenario: 0016 liquibase-elements
    liquibase-elements
    R16 : B01 Liquibase element name is ... = renameColumn
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'renameColumn'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  processing is not finished
    *     element name is 'renameColumn'

  @recommended
  Scenario: 0017 liquibase-elements
    liquibase-elements
    R17 : B01 Liquibase element name is ... = createIndex
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'createIndex'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  processing is not finished
    *     element name is 'createIndex'

  @recommended
  Scenario: 0018 liquibase-elements
    liquibase-elements
    R18 : B01 Liquibase element name is ... = changeSet
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'changeSet'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  processing is not finished
    *     element name is 'changeSet'

  @recommended
  Scenario: 0019 liquibase-elements
    liquibase-elements
    R19 : B01 Liquibase element name is ... = dropSequence
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'dropSequence'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'dropSequence'

  @recommended
  Scenario: 0020 liquibase-elements
    liquibase-elements
    R20 : B01 Liquibase element name is ... = createTable
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'createTable'
    When  liquibase-elements is called without tillTag defined
    Then  processing is not finished
    *     element name is 'createTable'

  @recommended
  Scenario: 0021 liquibase-elements
    liquibase-elements
    R21 : B01 Liquibase element name is ... = addPrimaryKey
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'addPrimaryKey'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  processing is not finished
    *     element name is 'addPrimaryKey'

  @recommended
  Scenario: 0022 liquibase-elements
    liquibase-elements
    R22 : B01 Liquibase element name is ... = dropTable
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropTable'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  processing is not finished
    *     element name is 'dropTable'

  @recommended
  Scenario: 0023 liquibase-elements
    liquibase-elements
    R23 : B01 Liquibase element name is ... = include
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'include'
    When  liquibase-elements is called without tillTag defined
    Then  processing is not finished
    *     element name is 'include'

  @recommended
  Scenario: 0024 liquibase-elements
    liquibase-elements
    R24 : B01 Liquibase element name is ... = createSequence
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'createSequence'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'createSequence'

  @recommended
  Scenario: 0025 liquibase-elements
    liquibase-elements
    R25 : B01 Liquibase element name is ... = createProcedure
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'createProcedure'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'createProcedure'

  @recommended
  Scenario: 0026 liquibase-elements
    liquibase-elements
    R26 : B01 Liquibase element name is ... = modifyDataType
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'modifyDataType'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  processing is not finished
    *     element name is 'modifyDataType'

  @recommended
  Scenario: 0027 liquibase-elements
    liquibase-elements
    R27 : B01 Liquibase element name is ... = update
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'update'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'update'

  @recommended
  Scenario: 0028 liquibase-elements
    liquibase-elements
    R28 : B01 Liquibase element name is ... = *
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'hugo'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that not supported message is logged
    *     element should ignored from processing
    *     processing is not finished

### end of generated test cases ###