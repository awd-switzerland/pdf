# encoding: utf-8

unless defined? Gem::Version
  begin
    require 'rubygems/version' # new style
  rescue LoadError
    require 'gem/version' # old style
  end
end

class Pdf
  Version = Gem::Version.new("0.0.2")
end
