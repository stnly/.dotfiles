IRB.conf[:AUTO_INDENT] = true
alias q exit

ANSI = {}
ANSI[:RESET]     = "\e[0m"
ANSI[:BOLD]      = "\e[1m"
ANSI[:UNDERLINE] = "\e[4m"
ANSI[:LGRAY]     = "\e[0;37m"
ANSI[:GRAY]      = "\e[1;30m"
ANSI[:RED]       = "\e[31m"
ANSI[:GREEN]     = "\e[32m"
ANSI[:YELLOW]    = "\e[33m"
ANSI[:BLUE]      = "\e[34m"
ANSI[:MAGENTA]   = "\e[35m"
ANSI[:CYAN]      = "\e[36m"
ANSI[:WHITE]     = "\e[37m"

def extend_console(name, care = true, required = true)
  if care
    require name if required
    yield if block_given?
    $console_extensions << "#{ANSI[:GREEN]}#{name}#{ANSI[:RESET]}"
  else
    $console_extensions << "#{ANSI[:GRAY]}#{name}#{ANSI[:RESET]}"
  end
rescue LoadError
  $console_extensions << "#{ANSI[:RED]}#{name}#{ANSI[:RESET]}"
end
$console_extensions = []

extend_console 'wirble' do
  Wirble.init(:history_uniq => false)
  Wirble.colorize
end

# Hirb makes tables easy.
extend_console 'hirb' do
  Hirb.enable
  extend Hirb::Console
end

# awesome_print is prints prettier than pretty_print
extend_console 'ap' do
  AwesomePrint.irb!
  alias pp ap
end


# Show them what they've won, Johnny
puts "#{ANSI[:BLUE]}~> Console extensions:#{ANSI[:RESET]} #{$console_extensions.join(' ')}#{ANSI[:RESET]}"

IRB::Irb.class_eval do
  def output_value
    ap @context.last_value
  end
end

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

class Array
  alias :__orig_inspect :inspect
  def inspect
    (length > 100) ? "[ ... #{length} elements ... ]" : __orig_inspect
  end
end

class Hash
  alias :__orig_inspect :inspect
  def inspect
    (length > 100) ? "{ ... #{length} keys ... }" : __orig_inspect
  end
end
