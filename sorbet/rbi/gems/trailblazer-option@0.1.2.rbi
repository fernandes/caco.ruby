# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `trailblazer-option` gem.
# Please instead update this file by running `bin/tapioca gem trailblazer-option`.

module Trailblazer
  class << self
    # source://trailblazer-context/0.5.1/lib/trailblazer/context.rb#29
    def Context(wrapped_options, mutable_options = T.unsafe(nil), context_options = T.unsafe(nil)); end

    # source://trailblazer-operation/0.9.0/lib/trailblazer/operation.rb#34
    def Operation(options); end

    # source://trailblazer-option//lib/trailblazer/option.rb#54
    def Option(value); end
  end
end

module Trailblazer::Cells; end

# source://trailblazer-cells/0.0.3/lib/trailblazer/cells/version.rb#3
Trailblazer::Cells::VERSION = T.let(T.unsafe(nil), String)

class Trailblazer::Option
  class << self
    # Generic builder for a callable "option".
    #
    # @param call_implementation [Class, Module] implements the process of calling the proc
    #   while passing arguments/options to it in a specific style (e.g. kw args, step interface).
    # @return [Proc] when called, this proc will evaluate its option (at run-time).
    #
    # source://trailblazer-option//lib/trailblazer/option.rb#43
    def build(value); end

    # Don't pass empty `keyword_arguments` because Ruby <= 2.6 passes an empty hash for `**{}`
    #
    # source://trailblazer-option//lib/trailblazer/option.rb#7
    def call!(value, *args, signal: T.unsafe(nil), keyword_arguments: T.unsafe(nil), **_arg4, &block); end

    # Note that #evaluate_callable, #evaluate_proc and #evaluate_method drop most of the args.
    # If you need those, override this class.
    #
    # @private
    #
    # source://trailblazer-option//lib/trailblazer/option.rb#23
    def evaluate_callable(value, *args, **options, &block); end

    # Make the exec_context's instance method a "lambda" and reuse #call!.
    #
    # @private
    #
    # source://trailblazer-option//lib/trailblazer/option.rb#35
    def evaluate_method(value, *args, exec_context: T.unsafe(nil), **options, &block); end

    # Pass given `value` as a block and evaluate it within `exec_context` binding.
    #
    # @private
    #
    # source://trailblazer-option//lib/trailblazer/option.rb#29
    def evaluate_proc(value, *args, signal: T.unsafe(nil), exec_context: T.unsafe(nil), **options); end
  end
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
