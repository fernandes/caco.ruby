# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `http-form_data` gem.
# Please instead update this file by running `bin/tapioca gem http-form_data`.

# Utility-belt to build form data request bodies.
# Provides support for `application/x-www-form-urlencoded` and
# `multipart/form-data` types.
#
# @example Usage
#
#   form = FormData.create({
#   :username     => "ixti",
#   :avatar_file  => FormData::File.new("/home/ixti/avatar.png")
#   })
#
#   # Assuming socket is an open socket to some HTTP server
#   socket << "POST /some-url HTTP/1.1\r\n"
#   socket << "Host: example.com\r\n"
#   socket << "Content-Type: #{form.content_type}\r\n"
#   socket << "Content-Length: #{form.content_length}\r\n"
#   socket << "\r\n"
#   socket << form.to_s
module HTTP::FormData
  class << self
    # FormData factory. Automatically selects best type depending on given
    # `data` Hash.
    #
    # @param data [#to_h, Hash]
    # @return [Multipart] if any of values is a {FormData::File}
    # @return [Urlencoded] otherwise
    #
    # source://http-form_data//lib/http/form_data.rb#44
    def create(data, encoder: T.unsafe(nil)); end

    # Coerce `obj` to Hash.
    #
    # @note Internal usage helper, to workaround lack of `#to_h` on Ruby < 2.1
    # @raise [Error] `obj` can't be coerced.
    # @return [Hash]
    #
    # source://http-form_data//lib/http/form_data.rb#59
    def ensure_hash(obj); end

    private

    # Tells whenever data contains multipart data or not.
    #
    # @param data [Hash]
    # @return [Boolean]
    #
    # source://http-form_data//lib/http/form_data.rb#74
    def multipart?(data); end
  end
end

# CRLF
#
# source://http-form_data//lib/http/form_data.rb#32
HTTP::FormData::CRLF = T.let(T.unsafe(nil), String)

# Provides IO interface across multiple IO objects.
class HTTP::FormData::CompositeIO
  # @param ios [Array<IO>] Array of IO objects
  # @return [CompositeIO] a new instance of CompositeIO
  #
  # source://http-form_data//lib/http/form_data/composite_io.rb#10
  def initialize(ios); end

  # Reads and returns partial content acrosss multiple IO objects.
  #
  # @param length [Integer] Number of bytes to retrieve
  # @param outbuf [String] String to be replaced with retrieved data
  # @return [String, nil]
  #
  # source://http-form_data//lib/http/form_data/composite_io.rb#31
  def read(length = T.unsafe(nil), outbuf = T.unsafe(nil)); end

  # Rewinds all IO objects and set cursor to the first IO object.
  #
  # source://http-form_data//lib/http/form_data/composite_io.rb#46
  def rewind; end

  # Returns sum of all IO sizes.
  #
  # source://http-form_data//lib/http/form_data/composite_io.rb#41
  def size; end

  private

  # Advances cursor to the next IO object.
  #
  # source://http-form_data//lib/http/form_data/composite_io.rb#83
  def advance_io; end

  # Returns IO object under the cursor.
  #
  # source://http-form_data//lib/http/form_data/composite_io.rb#78
  def current_io; end

  # Yields chunks with total length up to `length`.
  #
  # source://http-form_data//lib/http/form_data/composite_io.rb#54
  def read_chunks(length = T.unsafe(nil)); end

  # Reads chunk from current IO with length up to `max_length`.
  #
  # source://http-form_data//lib/http/form_data/composite_io.rb#67
  def readpartial(max_length = T.unsafe(nil)); end
end

# Generic FormData error.
class HTTP::FormData::Error < ::StandardError; end

# Represents file form param.
#
# @example Usage with StringIO
#
#   io = StringIO.new "foo bar baz"
#   FormData::File.new io, :filename => "foobar.txt"
# @example Usage with IO
#
#   File.open "/home/ixti/avatar.png" do |io|
#   FormData::File.new io
#   end
# @example Usage with pathname
#
#   FormData::File.new "/home/ixti/avatar.png"
class HTTP::FormData::File < ::HTTP::FormData::Part
  # @option opts
  # @option opts
  # @param path_or_io [String, Pathname, IO] Filename or IO instance.
  # @param opts [#to_h]
  # @return [File] a new instance of File
  # @see DEFAULT_MIME
  #
  # source://http-form_data//lib/http/form_data/file.rb#36
  def initialize(path_or_io, opts = T.unsafe(nil)); end

  # @deprecated Use #content_type instead
  #
  # source://http-form_data//lib/http/form_data/part.rb#18
  def mime_type; end

  private

  # source://http-form_data//lib/http/form_data/file.rb#61
  def filename_for(io); end

  # source://http-form_data//lib/http/form_data/file.rb#51
  def make_io(path_or_io); end
end

# Default MIME type
#
# source://http-form_data//lib/http/form_data/file.rb#23
HTTP::FormData::File::DEFAULT_MIME = T.let(T.unsafe(nil), String)

# `multipart/form-data` form data.
class HTTP::FormData::Multipart
  include ::HTTP::FormData::Readable

  # @param data [#to_h, Hash] form data key-value Hash
  # @return [Multipart] a new instance of Multipart
  #
  # source://http-form_data//lib/http/form_data/multipart.rb#18
  def initialize(data, boundary: T.unsafe(nil)); end

  # Returns the value of attribute boundary.
  #
  # source://http-form_data//lib/http/form_data/multipart.rb#15
  def boundary; end

  # Returns form data content size to be used for HTTP request
  # `Content-Length` header.
  #
  # @return [Integer]
  #
  # source://http-form_data//lib/http/form_data/readable.rb#30
  def content_length; end

  # Returns MIME type to be used for HTTP request `Content-Type` header.
  #
  # @return [String]
  #
  # source://http-form_data//lib/http/form_data/multipart.rb#36
  def content_type; end

  private

  # @return [String]
  #
  # source://http-form_data//lib/http/form_data/multipart.rb#49
  def glue; end

  # @return [String]
  #
  # source://http-form_data//lib/http/form_data/multipart.rb#54
  def tail; end

  class << self
    # Generates a string suitable for using as a boundary in multipart form
    # data.
    #
    # @return [String]
    #
    # source://http-form_data//lib/http/form_data/multipart.rb#29
    def generate_boundary; end
  end
end

# Utility class to represent multi-part chunks
class HTTP::FormData::Multipart::Param
  include ::HTTP::FormData::Readable

  # Initializes body part with headers and data.
  #
  # @example With {FormData::File} value
  #
  #   Content-Disposition: form-data; name="avatar"; filename="avatar.png"
  #   Content-Type: application/octet-stream
  #
  #   ...data of avatar.png...
  # @example With non-{FormData::File} value
  #
  #   Content-Disposition: form-data; name="username"
  #
  #   ixti
  # @param name [#to_s]
  # @param value [FormData::File, FormData::Part, #to_s]
  # @return [String]
  #
  # source://http-form_data//lib/http/form_data/multipart/param.rb#31
  def initialize(name, value); end

  private

  # source://http-form_data//lib/http/form_data/multipart/param.rb#78
  def content_type; end

  # source://http-form_data//lib/http/form_data/multipart/param.rb#82
  def filename; end

  # source://http-form_data//lib/http/form_data/multipart/param.rb#86
  def footer; end

  # source://http-form_data//lib/http/form_data/multipart/param.rb#64
  def header; end

  # source://http-form_data//lib/http/form_data/multipart/param.rb#72
  def parameters; end

  class << self
    # Flattens given `data` Hash into an array of `Param`'s.
    # Nested array are unwinded.
    # Behavior is similar to `URL.encode_www_form`.
    #
    # @param data [Hash]
    # @return [Array<FormData::MultiPart::Param>]
    #
    # source://http-form_data//lib/http/form_data/multipart/param.rb#50
    def coerce(data); end
  end
end

# Represents a body part of multipart/form-data request.
#
# @example Usage with String
#
#   body = "Message"
#   FormData::Part.new body, :content_type => 'foobar.txt; charset="UTF-8"'
class HTTP::FormData::Part
  include ::HTTP::FormData::Readable

  # @param body [#to_s]
  # @param content_type [String] Value of Content-Type header
  # @param filename [String] Value of filename parameter
  # @return [Part] a new instance of Part
  #
  # source://http-form_data//lib/http/form_data/part.rb#23
  def initialize(body, content_type: T.unsafe(nil), filename: T.unsafe(nil)); end

  # Returns the value of attribute content_type.
  #
  # source://http-form_data//lib/http/form_data/part.rb#18
  def content_type; end

  # Returns the value of attribute filename.
  #
  # source://http-form_data//lib/http/form_data/part.rb#18
  def filename; end
end

# Common behaviour for objects defined by an IO object.
module HTTP::FormData::Readable
  # Reads and returns part of IO content.
  #
  # @param length [Integer] Number of bytes to retrieve
  # @param outbuf [String] String to be replaced with retrieved data
  # @return [String, nil]
  #
  # source://http-form_data//lib/http/form_data/readable.rb#23
  def read(length = T.unsafe(nil), outbuf = T.unsafe(nil)); end

  # Rewinds the IO.
  #
  # source://http-form_data//lib/http/form_data/readable.rb#35
  def rewind; end

  # Returns IO size.
  #
  # @return [Integer]
  #
  # source://http-form_data//lib/http/form_data/readable.rb#30
  def size; end

  # Returns IO content.
  #
  # @return [String]
  #
  # source://http-form_data//lib/http/form_data/readable.rb#10
  def to_s; end
end

# `application/x-www-form-urlencoded` form data.
class HTTP::FormData::Urlencoded
  include ::HTTP::FormData::Readable

  # @param data [#to_h, Hash] form data key-value Hash
  # @return [Urlencoded] a new instance of Urlencoded
  #
  # source://http-form_data//lib/http/form_data/urlencoded.rb#66
  def initialize(data, encoder: T.unsafe(nil)); end

  # Returns form data content size to be used for HTTP request
  # `Content-Length` header.
  #
  # @return [Integer]
  #
  # source://http-form_data//lib/http/form_data/readable.rb#30
  def content_length; end

  # Returns MIME type to be used for HTTP request `Content-Type` header.
  #
  # @return [String]
  #
  # source://http-form_data//lib/http/form_data/urlencoded.rb#74
  def content_type; end

  class << self
    # Returns form data encoder implementation.
    # Default: `URI.encode_www_form`.
    #
    # @return [#call]
    # @see .encoder=
    #
    # source://http-form_data//lib/http/form_data/urlencoded.rb#60
    def encoder; end

    # Set custom form data encoder implementation.
    #
    # @example
    #
    #   module CustomFormDataEncoder
    #   UNESCAPED_CHARS = /[^a-z0-9\-\.\_\~]/i
    #
    #   def self.escape(s)
    #   ::URI::DEFAULT_PARSER.escape(s.to_s, UNESCAPED_CHARS)
    #   end
    #
    #   def self.call(data)
    #   parts = []
    #
    #   data.each do |k, v|
    #   k = escape(k)
    #
    #   if v.nil?
    #   parts << k
    #   elsif v.respond_to?(:to_ary)
    #   v.to_ary.each { |vv| parts << "#{k}=#{escape vv}" }
    #   else
    #   parts << "#{k}=#{escape v}"
    #   end
    #   end
    #
    #   parts.join("&")
    #   end
    #   end
    #
    #   HTTP::FormData::Urlencoded.encoder = CustomFormDataEncoder
    # @param implementation [#call]
    # @raise [ArgumentError] if implementation deos not responds to `#call`.
    # @return [void]
    #
    # source://http-form_data//lib/http/form_data/urlencoded.rb#50
    def encoder=(implementation); end
  end
end

# Gem version.
#
# source://http-form_data//lib/http/form_data/version.rb#6
HTTP::FormData::VERSION = T.let(T.unsafe(nil), String)
