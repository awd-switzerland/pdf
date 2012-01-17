# encoding: utf-8

Gem::Specification.new do |s|
  s.name                      = "pdf"
  s.version                   = "0.0.1"
  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1")
  s.authors                   = "AWD Schweiz"
  s.description               = <<-DESCRIPTION.gsub(/^    /, '').chomp
    Render PDFs using prince, haml and sass.
  DESCRIPTION
  s.summary                   = <<-SUMMARY.gsub(/^    /, '').chomp
    Render PDFs using prince, haml and sass.
  SUMMARY
  s.email                     = "sdd@awd.ch"
  s.executables.concat(Dir.cwd('bin') { Dir.glob('**/*') })
  s.files                     =
    Dir['bin/**/*'] +
    Dir['lib/**/*'] +
    Dir['rake/**/*'] +
    Dir['test/**/*'] +
    %w[
      pdf.gemspec
      Rakefile
      README.markdown
    ]
  s.rubygems_version          = "1.3.1"
  s.specification_version     = 3
end
