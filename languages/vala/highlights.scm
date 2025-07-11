; highlights.scm
; highlight comments and symbols
(comment) @comment

((comment) @comment.documentation
  (#match? @comment.documentation "^/[*][*][^*].*[*]/$"))

(symbol) @string.special.symbol

(member_access_expression
  (_)
  (identifier) @string.special.symbol)

; highlight constants
((member_access_expression
  (identifier) @constant)
  (#match? @constant "^[A-Z][A-Z0-9_]*$"))

((member_access_expression
  (member_access_expression) @keyword.import
  (identifier) @constant)
  (#match? @constant "^[A-Z][A-Z0-9_]*$"))

; highlight types and probable types
(type
  (symbol
    (_)? @module
    (identifier) @type))

((member_access_expression
  .
  (identifier) @type)
  (#match? @type "^[A-Z][A-Za-z_0-9]{2,}$"))

; highlight creation methods in object creation expressions
((object_creation_expression
  (type
    (symbol
      (symbol
        (symbol)? @keyword.import
        (identifier) @type)
      (identifier) @constructor)))
  (#match? @constructor "^[a-z][a-z0-9_]*$"))

(unqualified_type
  (symbol
    .
    (identifier) @type))

(unqualified_type
  (symbol
    (symbol) @module
    (identifier) @type))

(attribute) @attribute

(namespace_declaration
  (symbol) @module)

(method_declaration
  (symbol
    (symbol) @type
    (identifier) @function))

(method_declaration
  (symbol
    (identifier) @function))

(local_declaration
  (assignment
    (identifier) @variable))

(local_function_declaration
  (identifier) @function)

(destructor_declaration
  (identifier) @function)

(creation_method_declaration
  (symbol
    (symbol) @type
    (identifier) @constructor))

(creation_method_declaration
  (symbol
    (identifier) @constructor))

(constructor_declaration
  (_)?
  "construct" @keyword.function)

(enum_declaration
  (symbol) @type)

(enum_value
  (identifier) @constant)

(errordomain_declaration
  (symbol) @type)

(errorcode
  (identifier) @constant)

(constant_declaration
  (identifier) @constant)

(method_call_expression
  (member_access_expression
    (identifier) @function))

; highlight macros
((method_call_expression
  (member_access_expression
    (identifier) @function.macro))
  (#match? @function.macro "^assert[A-Za-z_0-9]*|error|info|debug|print|warning|warning_once$"))

(lambda_expression
  (identifier) @variable.parameter)

(parameter
  (identifier) @variable.parameter)

(property_declaration
  (symbol
    (identifier) @property))

(field_declaration
  (identifier) @variable.member)

[
  (this_access)
  (base_access)
  (value_access)
] @constant.builtin

(boolean) @boolean

(character) @character

(escape_sequence) @string.escape

(integer) @number

(null) @constant.builtin

(real) @number.float

(regex) @string.regexp

(string) @string

(string_formatter) @string.special

(template_string) @string

(template_string_expression) @string.special

(verbatim_string) @string

[
  "var"
  "void"
] @type.builtin

(if_directive
  expression: (_) @keyword.directive) @keyword

(elif_directive
  expression: (_) @keyword.directive) @keyword

(else_directive) @keyword

(endif_directive) @keyword

[
  "abstract"
  "construct"
  "continue"
  "default"
  "errordomain"
  "get"
  "inline"
  "new"
  "out"
  "override"
  "partial"
  "ref"
  "set"
  "signal"
  "virtual"
  "with"
] @keyword

[
  "enum"
  "class"
  "struct"
  "interface"
  "namespace"
] @keyword.type

"delegate" @keyword.function

[
  "async"
  "yield"
] @keyword.coroutine

[
  "const"
  "dynamic"
  "owned"
  "weak"
  "unowned"
] @keyword.modifier

[
  "case"
  "else"
  "if"
  "switch"
] @keyword.conditional

; specially highlight break statements in switch sections
(switch_section
  (break_statement
    "break" @keyword.conditional))

[
  "extern"
  "internal"
  "private"
  "protected"
  "public"
  "static"
  "sealed"
] @keyword.modifier

[
  "and"
  "as"
  "delete"
  "in"
  "is"
  "lock"
  "not"
  "or"
  "sizeof"
  "typeof"
] @keyword.operator

"using" @keyword.import

(using_directive
  (symbol) @module)

(symbol
  "global::" @module)

(array_creation_expression
  "new" @keyword.operator)

(object_creation_expression
  "new" @keyword.operator)

(argument
  "out" @keyword.operator)

(argument
  "ref" @keyword.operator)

[
  "break"
  "continue"
  "do"
  "for"
  "foreach"
  "while"
] @keyword.repeat

[
  "catch"
  "finally"
  "throw"
  "throws"
  "try"
] @keyword.exception

"return" @keyword.return

[
  "="
  "=="
  "+"
  "+="
  "-"
  "-="
  "++"
  "--"
  "|"
  "|="
  "&"
  "&="
  "^"
  "^="
  "/"
  "/="
  "*"
  "*="
  "%"
  "%="
  "<<"
  "<<="
  ">>"
  ">>="
  "."
  "?."
  "->"
  "!"
  "!="
  "~"
  "??"
  "?"
  ":"
  "<"
  "<="
  ">"
  ">="
  "||"
  "&&"
  "=>"
] @operator

[
  ","
  ";"
] @punctuation.delimiter

[
  "$("
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket
