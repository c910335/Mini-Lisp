class Lisp
macro
   BLANK      \s+
   INTEGER    0|[1-9]\d*|-[1-9]\d*
   BOOLEAN    \#[ft]
   FUNCTION   fun
   IDENTIFIER [+\-*\/<=>]|[a-z][0-9a-z\-]*
rule
   {BLANK}      # Toku ni nashi.
   {INTEGER}    { [:NUMBER, text.to_i] }
   {BOOLEAN}    { [:BOOL, text == '#t']}
   {FUNCTION}   { [:FUNC, text]}
   {IDENTIFIER} { [:ID, text]}
   .|\n         { [text, text] }
inner
end
