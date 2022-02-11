# frozen_string_literal: true

require 'jekyll'
require_relative 'jekyll_miscellaneous/version'

require_relative 'jekyll_miscellaneous/filters/base64'
require_relative 'jekyll_miscellaneous/filters/hash_color'
require_relative 'jekyll_miscellaneous/filters/regex_replace'
require_relative 'jekyll_miscellaneous/filters/truncate'
require_relative 'jekyll_miscellaneous/filters/uri_encode'

require_relative 'jekyll_miscellaneous/hooks/external_links'
require_relative 'jekyll_miscellaneous/hooks/mark'

require_relative 'jekyll_miscellaneous/tags/you_tube'
