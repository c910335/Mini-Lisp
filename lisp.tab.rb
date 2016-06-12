#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'


require './lisp.rex'

class Exp
   def initialize func, params
      @func, @params = func, params
   end

   def value
      call
   end

   def call
      @func.call @params
   end
end

class Identifier

   attr_reader :name

   def initialize name
      @name = name
   end

   def value
      $variables[@name].value
   end

   def call p = nil
      if p.nil?
         value.call
      else
         value.call p
      end
   end
end

module SelfValue
   def value
      self
   end
end

class Fixnum include SelfValue end
class TrueClass include SelfValue end
class FalseClass include SelfValue end
class Proc include SelfValue end

def func_new params, exps
   lambda do |p|
      values = []
      p.each do |ap|
         values << ap.value
      end
      stack = []
      params.each_index do |i|
         stack << $variables[params[i].name]
         $variables[params[i].name] = values[i]
      end
      r = nil
      exps.each do |exp|
         r = exp.value
      end
      params.each do |id|
         $variables[id.name] = stack.shift
      end
      r
   end
end

$variables = {
   '+' => ->(p) { s = 0; p.each { |n| s += n.value }; s },
   '-' => ->(p) { p[0].value - p[1].value },
   '*' => ->(p) { s = 1; p.each { |n| s *= n.value }; s },
   '/' => ->(p) { p[0].value / p[1].value },
   'mod' => ->(p) { p[0].value % p[1].value },
   '>' => ->(p) { p[0].value > p[1].value },
   '<' => ->(p) { p[0].value < p[1].value },
   '=' => ->(p) { p[0].value == p[1].value },
   'and' => ->(p) { p[0].value && p[1].value },
   'or' => ->(p) { p[0].value || p[1].value },
   'not' => ->(p) { !p[0].value },
   'print-num' => lambda { |p|
      num = p.first.value.to_i
      puts num
      num
   },
   'print-bool' => lambda { |p|
      bool = p.first.value ? '#t' : '#f'
      puts bool
      bool
   },
   'if' => ->(p) { if p[0].value then p[1].value else p[2].value end },
   'define' => ->(p) { $variables[p[0].name] = p[1].value }
}
$interaction = true

class Lisp < Racc::Parser

module_eval(<<'...end lisp.racc/module_eval...', 'lisp.racc', 121)

   def interpret source
      begin
         if source == :stdin
            scan_str gets
         else
            scan_file source
         end
      rescue ParseError, NoMemoryError
         puts 'Syntax Error'
      rescue TypeError
         puts 'Type Error'
      rescue
         puts 'Syntax Error'
      end
   end

...end lisp.racc/module_eval...
##### State transition tables begin ###

racc_action_table = [
     2,     9,     4,    13,   nil,     6,     7,     8,     4,   nil,
    11,     6,     7,     8,     4,    14,   nil,     6,     7,     8,
     4,    17,   nil,     6,     7,     8,     4,    19,   nil,     6,
     7,     8 ]

racc_action_check = [
     1,     2,     1,    11,   nil,     1,     1,     1,     4,   nil,
     4,     4,     4,     4,    12,    12,   nil,    12,    12,    12,
    16,    16,   nil,    16,    16,    16,    18,    18,   nil,    18,
    18,    18 ]

racc_action_pointer = [
   nil,     0,     1,   nil,     6,   nil,   nil,   nil,   nil,   nil,
   nil,     1,    12,   nil,   nil,   nil,    18,   nil,    24,   nil ]

racc_action_default = [
    -1,   -11,   -11,    -2,   -11,    -7,    -8,    -9,   -10,    20,
    -5,   -11,   -11,    -5,    -3,    -4,   -11,    -5,   -11,    -6 ]

racc_goto_table = [
    12,     3,     1,    16,    10,   nil,   nil,    18 ]

racc_goto_check = [
     4,     2,     1,     4,     2,   nil,   nil,     4 ]

racc_goto_pointer = [
   nil,     2,     0,   nil,   -10 ]

racc_goto_default = [
   nil,   nil,    15,     5,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 9, :_reduce_none,
  2, 9, :_reduce_2,
  4, 11, :_reduce_3,
  2, 12, :_reduce_4,
  0, 12, :_reduce_5,
  7, 10, :_reduce_6,
  1, 10, :_reduce_none,
  1, 10, :_reduce_none,
  1, 10, :_reduce_none,
  1, 10, :_reduce_10 ]

racc_reduce_n = 11

racc_shift_n = 20

racc_token_table = {
  false => 0,
  :error => 1,
  "(" => 2,
  ")" => 3,
  :FUNC => 4,
  :NUMBER => 5,
  :BOOL => 6,
  :ID => 7 }

racc_nt_base = 8

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"(\"",
  "\")\"",
  "FUNC",
  "NUMBER",
  "BOOL",
  "ID",
  "$start",
  "main",
  "param",
  "exp",
  "params" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'lisp.racc', 5)
  def _reduce_2(val, _values, result)
     result = val[1].value; puts result if $interaction 
    result
  end
.,.,

module_eval(<<'.,.,', 'lisp.racc', 7)
  def _reduce_3(val, _values, result)
     result = Exp.new val[1], val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'lisp.racc', 9)
  def _reduce_4(val, _values, result)
     result = val[0] << val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'lisp.racc', 10)
  def _reduce_5(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'lisp.racc', 12)
  def _reduce_6(val, _values, result)
     result = func_new val[3], val[5] 
    result
  end
.,.,

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

module_eval(<<'.,.,', 'lisp.racc', 16)
  def _reduce_10(val, _values, result)
     result = Identifier.new val[0] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Lisp


filename = ARGV[0]
lisp = Lisp.new

if filename.nil?
   loop do
      print '> '
      lisp.interpret :stdin
   end
else
   $interaction = false
   lisp.interpret filename
end
