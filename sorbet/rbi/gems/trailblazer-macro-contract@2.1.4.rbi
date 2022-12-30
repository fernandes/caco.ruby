# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `trailblazer-macro-contract` gem.
# Please instead update this file by running `bin/tapioca gem trailblazer-macro-contract`.

# This is the namespace container for {Contract::}, {Policy::} and friends.
module Trailblazer::Activity::DSL::Linear::Helper::Constants; end

# All macros sit in the {Trailblazer::Macro::Contract} namespace, where we forward calls from
# operations and activities to.
#
# source://trailblazer-macro-contract//lib/trailblazer/macro/contract.rb#16
Trailblazer::Activity::DSL::Linear::Helper::Constants::Contract = Trailblazer::Macro::Contract

# source://trailblazer-macro/2.1.13/lib/trailblazer/macro.rb#72
Trailblazer::Activity::DSL::Linear::Helper::Constants::Policy = Trailblazer::Macro::Policy

module Trailblazer::Macro::Contract
  class << self
    # source://trailblazer-macro-contract//lib/trailblazer/macro/contract/build.rb#6
    def Build(name: T.unsafe(nil), constant: T.unsafe(nil), builder: T.unsafe(nil)); end

    # source://trailblazer-macro-contract//lib/trailblazer/macro/contract/persist.rb#4
    def Persist(method: T.unsafe(nil), name: T.unsafe(nil)); end

    # result.contract = {..}
    # result.contract.errors = {..}
    # Deviate to left track if optional key is not found in params.
    # Deviate to left if validation result falsey.
    #
    # source://trailblazer-macro-contract//lib/trailblazer/macro/contract/validate.rb#8
    def Validate(skip_extract: T.unsafe(nil), name: T.unsafe(nil), representer: T.unsafe(nil), key: T.unsafe(nil), constant: T.unsafe(nil), invalid_data_terminus: T.unsafe(nil)); end
  end
end

module Trailblazer::Macro::Contract::DSL
  # This is the class level DSL method.
  #   Op.contract #=> returns contract class
  #   Op.contract do .. end # defines contract
  #   Op.contract CommentForm # copies (and subclasses) external contract.
  #   Op.contract CommentForm do .. end # copies and extends contract.
  #
  # source://trailblazer-macro-contract//lib/trailblazer/macro/contract/build.rb#56
  def contract(name = T.unsafe(nil), constant = T.unsafe(nil), base: T.unsafe(nil), &block); end

  class << self
    # @private
    #
    # source://trailblazer-macro-contract//lib/trailblazer/macro/contract/build.rb#46
    def extended(extender); end
  end
end

class Trailblazer::Macro::Contract::Validate
  # @return [Validate] a new instance of Validate
  #
  # source://trailblazer-macro-contract//lib/trailblazer/macro/contract/validate.rb#52
  def initialize(contract_path:, name: T.unsafe(nil), representer: T.unsafe(nil), params_path: T.unsafe(nil)); end

  # Task: Validates contract `:name`.
  #
  # source://trailblazer-macro-contract//lib/trailblazer/macro/contract/validate.rb#57
  def call(ctx, **_arg1); end

  # source://trailblazer-macro-contract//lib/trailblazer/macro/contract/validate.rb#65
  def validate!(ctx, representer: T.unsafe(nil), from: T.unsafe(nil), params_path: T.unsafe(nil)); end
end

# Task: extract the contract's input from params by reading `:key`.
class Trailblazer::Macro::Contract::Validate::Extract
  # @return [Extract] a new instance of Extract
  #
  # source://trailblazer-macro-contract//lib/trailblazer/macro/contract/validate.rb#42
  def initialize(key_path: T.unsafe(nil), params_path: T.unsafe(nil)); end

  # source://trailblazer-macro-contract//lib/trailblazer/macro/contract/validate.rb#46
  def call(ctx, params: T.unsafe(nil), **_arg2); end
end

module Trailblazer::Version; end
module Trailblazer::Version::Activity; end

# source://trailblazer-activity/0.15.0/lib/trailblazer/activity/version.rb#4
Trailblazer::Version::Activity::VERSION = T.let(T.unsafe(nil), String)

module Trailblazer::Version::Developer; end

# source://trailblazer-developer/0.0.27/lib/trailblazer/developer/version.rb#4
Trailblazer::Version::Developer::VERSION = T.let(T.unsafe(nil), String)

module Trailblazer::Version::Operation; end

# source://trailblazer-operation/0.9.0/lib/trailblazer/operation/version.rb#4
Trailblazer::Version::Operation::VERSION = T.let(T.unsafe(nil), String)

# source://trailblazer/2.1.2/lib/trailblazer/version.rb#3
Trailblazer::Version::VERSION = T.let(T.unsafe(nil), String)