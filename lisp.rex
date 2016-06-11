class Lisp
macro
   BLANK      \s+
   INTEGER    \d+
   BOOLEAN    \#[ft]
   FUNCTION   fun
   IDENTIFIER [$a-z_+\-*\/<=>][0-9a-z_$+\-*\/<=>]*
rule
   {BLANK}      # Toku ni nashi.
   {INTEGER}    { [:NUMBER, text.to_i] }
   {BOOLEAN}    { [:BOOL, text == '#t']}
   {FUNCTION}   { [:FUNC, text]}
   {IDENTIFIER} { [:ID, text]}
   .|\n         { [text, text] }
inner
end
