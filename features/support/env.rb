APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..','..'))
$: << File.join(APP_ROOT, 'lib/') # so rspec knows where your file could be


require "rertools"
