# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.1.0] - 2020-12-12
### Added
- Layout/BeginEndAlignment
- Lint/ConstantDefinitionInBlock
- Lint/DuplicateBranch
- Lint/DuplicateRegexpCharacterClassElement
- Lint/EmptyBlock
- Lint/EmptyClass
- Lint/HashCompareByIdentity
- Lint/IdentityComparison
- Lint/NoReturnInBeginEndBlocks
- Lint/RedundantSafeNavigation
- Lint/ToEnumArguments
- Lint/UnexpectedBlockArity
- Lint/UnmodifiedReduceAccumulator
- Lint/UselessTimes
- Performance/ArraySemiInfiniteRangeSlice
- Performance/BlockGivenWithExplicitBlock
- Performance/CollectionLiteralInLoop
- Performance/ConstantRegexp
- Performance/MethodObjectAsBlock
- Performance/Sum
- RSpec/Rails/HttpStatus
- Rails/AfterCommitOverride
- Rails/ArelStar
- Rails/AttributeDefaultBlockValue
- Rails/SquishedSQLHeredocs
- Rails/WhereEquals
- Rails/WhereNot
- Style/ArgumentsForwarding
- Style/ClassEqualityComparison
- Style/CollectionCompact
- Style/DocumentDynamicEvalDefinition
- Style/NegatedIfElseCondition
- Style/NilLambda
- Style/RedundantArgument
- Style/StaticClass
- Style/SwapValues
### Changed
- Ruby version from 2.7.1 to 2.7.2
- Enabler to create tmp directory
- Gem rubocop from 0.90 to 1.6.1
- Gem rubocop-performance from 1.7.1 to 1.9.1
- Gem rubocop-rails from 2.7.1 to 2.9.0
- Gem rubocop-rspec from 1.43.2 to 2.0.1
- Enabled Performance/OpenStruct
- Enabled RSpec/DescribedClassModuleWrapping
- Disabled Rails/CreateTableWithTimestamps:

## [1.0.1] - 2020-09-02
### Changed
- Required Ruby version from 2.7.1 to 2.6.5
### Fixed
- Layout/ClassStructure - changed configuration option SafeAutoCorrect to AutoCorrect

## [1.0.0] - 2020-09-02
### Added
- Latest RuboCop version with following extensions:
  - rubocop-performance
  - rubocop-rails
  - rubocop-rake
  - rubocop-rspec
- Custom configuration for all the RuboCop extensions
- Continuous Delivery system to rubygems.org
- Binary to enable pending cops of the latest RuboCop gems versions
- Gem specification file
- All the repository's meta-files, such as LICENSE, README, CONTRIBUTING and CHANGELOG
