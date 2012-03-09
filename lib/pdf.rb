class Pdf
  @prince_path = `which prince`.chomp # cross-platform compatibility?

  class <<self
    attr_accessor :prince_path
  end

  def self.pdf_from_haml(haml, scope=nil, locals={}, haml_options={}, &block)
    from_haml(haml, scope, locals, haml_options, &block).to_pdf_string
  end

  def self.from_haml(haml, scope=nil, locals={}, haml_options={}, &block)
    scope ||= Object.new
    locals  = locals.reject { |k,v|
      if k =~ /^@/ then
        scope.instance_variable_set(k, v)
        true
      end
    }
    new(Haml::Engine.new(haml, haml_options).render(scope, locals, &block))
  end

  attr_reader :string

  def initialize(string)
    @string = string
  end

  def to_pdf_string
    executable = self.class.prince_path
    options    = %w[--silent - -o -]
    output     = IO.popen([executable, *options], "w+:binary") do |pdf|
      pdf.puts(string)
      pdf.close_write
      pdf.gets(nil)
    end

    output
  end

  def to_pdf_file(output_file)
    raise "Not yet implemented"
  end
end