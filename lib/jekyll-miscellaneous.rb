# frozen_string_literal: true

require 'jekyll'
require_relative 'jekyll-miscellaneous/version'

require_relative 'jekyll-miscellaneous/filters/base64'
require_relative 'jekyll-miscellaneous/filters/hash_color'
require_relative 'jekyll-miscellaneous/filters/regex_replace'
require_relative 'jekyll-miscellaneous/filters/truncate'
require_relative 'jekyll-miscellaneous/filters/uri_encode'

require_relative 'jekyll-miscellaneous/hooks/external_links'
require_relative 'jekyll-miscellaneous/hooks/mark'

require_relative 'jekyll-miscellaneous/tags/youtube'
