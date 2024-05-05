# Diese Datei wurde erzeugt durch LF-ET 2.3.0 (240413a) und Kommandozeile:
# -GenTest "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/liquibase-elements.lfet" -Group "Cucumber" -Config "Config" -ContinueOnError -GtdDirectory "../test/features/testdata" -NonExecutableRules "50" -RecommendedTestCases -OutGherkin "liquibase-elements.testcases.feature" -InputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet" -OutputRootfolder "/opt/data/github/asciidoctor/asciidoctor-liquibase/test/features"
# 
# Aktueller Benutzer: constantin
# Aktuelles Verzeichnis (user.dir): "/opt/data/github/asciidoctor/asciidoctor-liquibase"
# Benötigte Zeit: 00:00:00.613 (05.05.2024 22:41:08.073 - 05.05.2024 22:41:08.687)
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
    R01 : B01 Liquibase element name is ... = loadData
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'loadData'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'loadData'

  @recommended
  Scenario: 0002 liquibase-elements
    liquibase-elements
    R02 : B01 Liquibase element name is ... = insert
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'insert'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'insert'

  @recommended
  Scenario: 0003 liquibase-elements
    liquibase-elements
    R03 : B01 Liquibase element name is ... = sql
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'sql'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'sql'

  @recommended
  Scenario: 0004 liquibase-elements
    liquibase-elements
    R04 : B01 Liquibase element name is ... = sqlFile
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'sqlFile'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'sqlFile'

  @recommended
  Scenario: 0005 liquibase-elements
    liquibase-elements
    R05 : B01 Liquibase element name is ... = preConditions
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'preConditions'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'preConditions'

  @recommended
  Scenario: 0006 liquibase-elements
    liquibase-elements
    R06 : B01 Liquibase element name is ... = property
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'property'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'property'

  @recommended
  Scenario: 0007 liquibase-elements
    liquibase-elements
    R07 : B01 Liquibase element name is ... = tagDatabase ; B02 tag = tillTag = Y
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'tagDatabase' with tag 'V1.0.0'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  processing is finished
    *     element name is 'tagDatabase'

  @recommended
  Scenario: 0008 liquibase-elements
    liquibase-elements
    R08 : B01 Liquibase element name is ... = tagDatabase ; B02 tag = tillTag = N
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'tagDatabase' with tag 'V3.0.0'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  element should ignored from processing
    *     processing is not finished
    *     element name is 'tagDatabase'

  @recommended
  Scenario: 0009 liquibase-elements
    liquibase-elements
    R09 : B01 Liquibase element name is ... = addForeignKeyConstraint
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'addForeignKeyConstraint'
    When  liquibase-elements is called without tillTag defined
    Then  processing is not finished
    *     element name is 'addForeignKeyConstraint'

  @recommended
  Scenario: 0010 liquibase-elements
    liquibase-elements
    R10 : B01 Liquibase element name is ... = addUniqueConstraint
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'addUniqueConstraint'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'addUniqueConstraint'

  @recommended
  Scenario: 0011 liquibase-elements
    liquibase-elements
    R11 : B01 Liquibase element name is ... = rollback
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'rollback'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'rollback'

  @recommended
  Scenario: 0012 liquibase-elements
    liquibase-elements
    R12 : B01 Liquibase element name is ... = dropColumn
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropColumn'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  processing is not finished
    *     element name is 'dropColumn'

  @recommended
  Scenario: 0013 liquibase-elements
    liquibase-elements
    R13 : B01 Liquibase element name is ... = addColumn
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'addColumn'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  processing is not finished
    *     element name is 'addColumn'

  @recommended
  Scenario: 0014 liquibase-elements
    liquibase-elements
    R14 : B01 Liquibase element name is ... = comment
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'comment'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'comment'

  @recommended
  Scenario: 0015 liquibase-elements
    liquibase-elements
    R15 : B01 Liquibase element name is ... = renameColumn
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'renameColumn'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  processing is not finished
    *     element name is 'renameColumn'

  @recommended
  Scenario: 0016 liquibase-elements
    liquibase-elements
    R16 : B01 Liquibase element name is ... = changeSet
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'changeSet'
    When  liquibase-elements is called without tillTag defined
    Then  processing is not finished
    *     element name is 'changeSet'

  @recommended
  Scenario: 0017 liquibase-elements
    liquibase-elements
    R17 : B01 Liquibase element name is ... = dropSequence
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropSequence'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'dropSequence'

  @recommended
  Scenario: 0018 liquibase-elements
    liquibase-elements
    R18 : B01 Liquibase element name is ... = createTable
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'createTable'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  processing is not finished
    *     element name is 'createTable'

  @recommended
  Scenario: 0019 liquibase-elements
    liquibase-elements
    R19 : B01 Liquibase element name is ... = addPrimaryKey
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'addPrimaryKey'
    When  liquibase-elements is called without tillTag defined
    Then  processing is not finished
    *     element name is 'addPrimaryKey'

  @recommended
  Scenario: 0020 liquibase-elements
    liquibase-elements
    R20 : B01 Liquibase element name is ... = dropTable
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'dropTable'
    When  liquibase-elements is called without tillTag defined
    Then  processing is not finished
    *     element name is 'dropTable'

  @recommended
  Scenario: 0021 liquibase-elements
    liquibase-elements
    R21 : B01 Liquibase element name is ... = include
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'include'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  processing is not finished
    *     element name is 'include'

  @recommended
  Scenario: 0022 liquibase-elements
    liquibase-elements
    R22 : B01 Liquibase element name is ... = createSequence
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'createSequence'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'createSequence'

  @recommended
  Scenario: 0023 liquibase-elements
    liquibase-elements
    R23 : B01 Liquibase element name is ... = createProcedure
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'createProcedure'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'createProcedure'

  @recommended
  Scenario: 0024 liquibase-elements
    liquibase-elements
    R24 : B01 Liquibase element name is ... = modifyDataType
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'modifyDataType'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  processing is not finished
    *     element name is 'modifyDataType'

  @recommended
  Scenario: 0025 liquibase-elements
    liquibase-elements
    R25 : B01 Liquibase element name is ... = update
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'update'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'update'

  @recommended
  Scenario: 0026 liquibase-elements
    liquibase-elements
    R26 : B01 Liquibase element name is ... = createView
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'createView'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0027 liquibase-elements
    liquibase-elements
    R27 : B01 Liquibase element name is ... = dropView
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropView'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0028 liquibase-elements
    liquibase-elements
    R28 : B01 Liquibase element name is ... = renameView
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'renameView'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0029 liquibase-elements
    liquibase-elements
    R29 : B01 Liquibase element name is ... = setTableRemarks
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'setTableRemarks'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0030 liquibase-elements
    liquibase-elements
    R30 : B01 Liquibase element name is ... = setColumnRemarks
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'setColumnRemarks'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0031 liquibase-elements
    liquibase-elements
    R31 : B01 Liquibase element name is ... = renameTrigger
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'renameTrigger'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0032 liquibase-elements
    liquibase-elements
    R32 : B01 Liquibase element name is ... = renameTable
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'renameTable'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0033 liquibase-elements
    liquibase-elements
    R33 : B01 Liquibase element name is ... = renameSequence
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'renameSequence'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0034 liquibase-elements
    liquibase-elements
    R34 : B01 Liquibase element name is ... = enableTrigger
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'enableTrigger'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0035 liquibase-elements
    liquibase-elements
    R35 : B01 Liquibase element name is ... = dropTrigger
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'dropTrigger'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0036 liquibase-elements
    liquibase-elements
    R36 : B01 Liquibase element name is ... = dropSynonym
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropSynonym'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0037 liquibase-elements
    liquibase-elements
    R37 : B01 Liquibase element name is ... = dropProcedure
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropProcedure'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0038 liquibase-elements
    liquibase-elements
    R38 : B01 Liquibase element name is ... = dropPackageBody
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'dropPackageBody'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0039 liquibase-elements
    liquibase-elements
    R39 : B01 Liquibase element name is ... = dropPackage
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropPackage'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0040 liquibase-elements
    liquibase-elements
    R40 : B01 Liquibase element name is ... = dropIndex
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'dropIndex'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0041 liquibase-elements
    liquibase-elements
    R41 : B01 Liquibase element name is ... = dropFunction
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropFunction'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0042 liquibase-elements
    liquibase-elements
    R42 : B01 Liquibase element name is ... = disableTrigger
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'disableTrigger'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0043 liquibase-elements
    liquibase-elements
    R43 : B01 Liquibase element name is ... = createTrigger
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'createTrigger'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0044 liquibase-elements
    liquibase-elements
    R44 : B01 Liquibase element name is ... = createSynonym
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'createSynonym'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0045 liquibase-elements
    liquibase-elements
    R45 : B01 Liquibase element name is ... = createPackageBody
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'createPackageBody'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0046 liquibase-elements
    liquibase-elements
    R46 : B01 Liquibase element name is ... = createPackage
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'createPackage'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0047 liquibase-elements
    liquibase-elements
    R47 : B01 Liquibase element name is ... = createIndex
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'createIndex'
    When  liquibase-elements is called without tillTag defined
    Then  processing is not finished
    *     element name is 'createIndex'

  @recommended
  Scenario: 0048 liquibase-elements
    liquibase-elements
    R48 : B01 Liquibase element name is ... = createFunction
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'createFunction'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0049 liquibase-elements
    liquibase-elements
    R49 : B01 Liquibase element name is ... = alterSequence
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'alterSequence'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0050 liquibase-elements
    liquibase-elements
    R50 : B01 Liquibase element name is ... = addAutoIncrement
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'addAutoIncrement'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0051 liquibase-elements
    liquibase-elements
    R51 : B01 Liquibase element name is ... = addCheckConstraint
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'addCheckConstraint'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0052 liquibase-elements
    liquibase-elements
    R52 : B01 Liquibase element name is ... = addDefaultValue
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'addDefaultValue'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished
    *     element name is 'addDefaultValue'

  @recommended
  Scenario: 0053 liquibase-elements
    liquibase-elements
    R53 : B01 Liquibase element name is ... = addNotNullConstraint
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'addNotNullConstraint'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0054 liquibase-elements
    liquibase-elements
    R54 : B01 Liquibase element name is ... = disableCheckConstraint
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'disableCheckConstraint'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0055 liquibase-elements
    liquibase-elements
    R55 : B01 Liquibase element name is ... = dropAllForeignKeyConstraints
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropAllForeignKeyConstraints'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0056 liquibase-elements
    liquibase-elements
    R56 : B01 Liquibase element name is ... = dropCheckConstraint
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'dropCheckConstraint'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0057 liquibase-elements
    liquibase-elements
    R57 : B01 Liquibase element name is ... = dropDefaultValue
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropDefaultValue'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0058 liquibase-elements
    liquibase-elements
    R58 : B01 Liquibase element name is ... = dropForeignKeyConstraint
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'dropForeignKeyConstraint'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0059 liquibase-elements
    liquibase-elements
    R59 : B01 Liquibase element name is ... = dropNotNullConstraint
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropNotNullConstraint'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0060 liquibase-elements
    liquibase-elements
    R60 : B01 Liquibase element name is ... = dropPrimaryKey
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'dropPrimaryKey'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0061 liquibase-elements
    liquibase-elements
    R61 : B01 Liquibase element name is ... = dropUniqueConstraint
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'dropUniqueConstraint'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0062 liquibase-elements
    liquibase-elements
    R62 : B01 Liquibase element name is ... = enableCheckConstraint
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'enableCheckConstraint'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0063 liquibase-elements
    liquibase-elements
    R63 : B01 Liquibase element name is ... = addLookupTable
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'addLookupTable'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0064 liquibase-elements
    liquibase-elements
    R64 : B01 Liquibase element name is ... = delete
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'delete'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0065 liquibase-elements
    liquibase-elements
    R65 : B01 Liquibase element name is ... = loadUpdateData
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'loadUpdateData'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0066 liquibase-elements
    liquibase-elements
    R66 : B01 Liquibase element name is ... = mergeColumns
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'mergeColumns'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0067 liquibase-elements
    liquibase-elements
    R67 : B01 Liquibase element name is ... = customChange
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'customChange'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0068 liquibase-elements
    liquibase-elements
    R68 : B01 Liquibase element name is ... = empty
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'empty'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0069 liquibase-elements
    liquibase-elements
    R69 : B01 Liquibase element name is ... = executeCommand
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'executeCommand'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0070 liquibase-elements
    liquibase-elements
    R70 : B01 Liquibase element name is ... = includeAll
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'includeAll'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0071 liquibase-elements
    liquibase-elements
    R71 : B01 Liquibase element name is ... = markUnused
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'markUnused'
    When  liquibase-elements is called without tillTag defined
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0072 liquibase-elements
    liquibase-elements
    R72 : B01 Liquibase element name is ... = modifyChangeSets
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'modifyChangeSets'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0073 liquibase-elements
    liquibase-elements
    R73 : B01 Liquibase element name is ... = output
    Given xml tag value callback function is provided
    *     define xml element name callback function
    *     xml based liquibase element name is 'output'
    When  liquibase-elements is called with tillTag 'V2.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0074 liquibase-elements
    liquibase-elements
    R74 : B01 Liquibase element name is ... = stop
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is 'stop'
    When  liquibase-elements is called with tillTag 'V1.0.0'
    Then  Check that ignore message is logged
    *     element should ignored from processing
    *     processing is not finished

  @recommended
  Scenario: 0075 liquibase-elements
    liquibase-elements
    R75 : B01 Liquibase element name is ... = *
    Given yaml tag value callback function is provided
    *     define yaml element name callback function
    *     yaml based liquibase element name is '*'
    When  liquibase-elements is called without tillTag defined
    Then  Check that not supported message is logged
    *     element should ignored from processing
    *     processing is not finished

### end of generated test cases ###