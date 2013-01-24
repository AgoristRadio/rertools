require 'bundler/setup'

# TODO check if these needed to manually require? or does bundler setup take care of it?

require 'httparty'
require 'psych'
require "mp3info"
require "awesome_print"
require 'xmlrpc/client'
require 'redcarpet'
require 'mechanize'

require_relative "rertools/version"
require_relative "rertools/config"

require_relative "rertools/show_notes"
require_relative "rertools/show_notes_downloader"
require_relative "rertools/cli"
require_relative "rertools/mp3"
require_relative "rertools/mp3_uploader"
require_relative "rertools/episode_poster"
require_relative "rertools/wordpress"

